/// @description 
if(bob_inst.greeting_now==greeting_sentencenum){
	if(first_greeting==after_greeting){
		if(keyboard_check_pressed(global.keyz)) scr_fadeout(global.checkpoint_rm,global.checkpoint_x,global.checkpoint_y);//进入游戏
	}
	else obj_button1.button_tary=0;//出现按钮
}
sprite_index=greeting_sprite[obj_title_chatbubbles.greeting_now];