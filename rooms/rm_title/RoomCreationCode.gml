with(instance_create_layer(0,0,"Instances",obj_button1)){
	if(file_exists("file0.sav")){
		ini_open("file0.sav");
		var m=ini_read_real("progress","titlenum",1);
		if(m) button_num=4;
		else button_num=3;
		ini_close();
	}else button_num=3;
}
with(instance_create_layer(288,32,"greeting_character",obj_title_greetingcharacter)){
	if(file_exists("file0.sav")){
		ini_open("file0.sav");
		first_greeting=ini_read_real("progress","first_greeting",1);
		after_greeting=ini_read_real("progress","after_greeting",2);
		ini_close();
	}else{//第一次打开游戏，背景介绍
		first_greeting=1;
		after_greeting=2;
		scr_game_txt_greeting(first_greeting);
	}
}
scr_fadein();
if(!instance_exists(obj_DEBUG)){
	instance_create_layer(0,0,"instances",obj_DEBUG)
}