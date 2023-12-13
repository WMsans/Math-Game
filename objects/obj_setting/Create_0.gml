global.setting=1;
with(obj_DEBUG){
	instance_deactivate_all(1);
	pause_surf=surface_create(resw, resh);
	surface_set_target (pause_surf);
	draw_surface (application_surface,0,0);
	surface_reset_target();
	//Back up this surface to a buffer in case we lose it (screen focus, etc) if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);
	pause_surfbuffer = buffer_create(resw * resh * 4, buffer_fixed, 1); 
	buffer_get_surface (pause_surfbuffer, pause_surf, 0);
}

//create pages
if(file_exists("setting.sav")){
	ini_open("setting.sav");
	ds_menu_main=scr_create_menu_page(
		["Resume",element_type.script_runner,scr_menu_resume],
		["Audio",element_type.page_transfer,pages.audio],
		["Graphics",element_type.page_transfer,pages.graphics],
		["Remapping",element_type.script_runner,scr_rmgoto_remapping],
		["Auto run",element_type.toggle,scr_change_autorun,ini_read_real("main","Auto run",0),["On","Off"]],
		["Mode",element_type.shift,scr_change_mode,ini_read_real("main","Mode",2),["Peaceful","Easy","Normal","Hard"]],
		["Back to title",element_type.script_runner,scr_rmgoto_title]
	);
	ds_audio=scr_create_menu_page(
		["Master",element_type.slider,scr_change_volume_master,ini_read_real("audio","Master",0.75),[0,1]],
		["Sounds",element_type.slider,scr_change_volume_sound,ini_read_real("audio","Sounds",1),[0,1]],
		["Music",element_type.slider,scr_change_volume_music,ini_read_real("audio","Music",1),[0,1]],
		["Back",element_type.page_transfer,pages.main]
	);
	ds_graphic=scr_create_menu_page(
		["Full Screen",element_type.toggle,scr_fullscreen,!window_get_fullscreen(),["On","Off"]],
		["Back",element_type.page_transfer,pages.main]
	);
	ini_close();
}else{
	ds_menu_main=scr_create_menu_page(
		["Resume",element_type.script_runner,scr_menu_resume],
		["Audio",element_type.page_transfer,pages.audio],
		["Graphics",element_type.page_transfer,pages.graphics],
		["Remapping",element_type.script_runner,scr_rmgoto_remapping],
		["Auto run",element_type.toggle,scr_change_autorun,0,["On","Off"]],
		["Mode",element_type.shift,scr_change_mode,2,["Peaceful","Easy","Normal","Hard"]],
		["Back to title",element_type.script_runner,scr_rmgoto_title]
	);
	ds_audio=scr_create_menu_page(
		["Master",element_type.slider,scr_change_volume_master,0.75,[0,1]],
		["Sounds",element_type.slider,scr_change_volume_sound,1,[0,1]],
		["Music",element_type.slider,scr_change_volume_music,1,[0,1]],
		["Back",element_type.page_transfer,pages.main]
	);
	ds_graphic=scr_create_menu_page(
		["Window Mode",element_type.toggle,scr_fullscreen,!window_get_fullscreen(),["On","Off"]],
		["Back",element_type.page_transfer,pages.main]
	);
}
page=0;
ds_menu_pages=[ds_menu_main,ds_audio,ds_graphic];

var i=0,array_len=array_length_1d(ds_menu_pages);
repeat(array_len){
	menu_option[i]=0;
	for(var j=0;j<10;j++){
		x_tar_offset[i][j]=0;
		x_offset[i][j]=0;
	}
	i++;
}

inputting=false;