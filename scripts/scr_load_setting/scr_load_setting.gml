function scr_load_setting(){
enum pages{
	main,
	audio,
	graphics,
	height
}
enum element_type{
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}
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
ds_menu_pages=[ds_menu_main,ds_audio,ds_graphic];


var array_len=array_length_1d(ds_menu_pages);
for(var page=0;page<array_len;page++){
var ds_grid=ds_menu_pages[page],ds_height=ds_grid_height(ds_grid);
for(var menuop=0;menuop<ds_height;menuop++){
	switch(ds_grid[# 1,menuop]){
		case element_type.shift: 
		case element_type.slider:
		case element_type.toggle:
		case element_type.input:
			script_execute(ds_grid[# 2, menuop],ds_grid[# 3, menuop]);
			break;
	}
}
}
}