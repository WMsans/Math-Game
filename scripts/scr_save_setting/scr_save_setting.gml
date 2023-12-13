function scr_save_setting(){
	if(file_exists("setting.sav")){
		file_delete("setting.sav");
	}
	ini_open("setting.sav");
	ini_write_real("main","Auto run",ds_menu_main[# 3, 4]);
	ini_write_real("main","Mode",ds_menu_main[# 3, 5]);
	ini_write_real("audio","Master",ds_audio[# 3, 0]);
	ini_write_real("audio","Sounds",ds_audio[# 3, 1]);
	ini_write_real("audio","Music",ds_audio[# 3, 2]);
	ini_write_real("graphic","Window Mode",ds_graphic[# 3, 0]);
	
}