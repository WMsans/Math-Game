function scr_game_txt_greeting(_text_id){//translate
	greeting_sentencenum=0;//初始化一下
	first_greeting=_text_id;
	switch(_text_id){
		case 1:
			/*
			scr_text_gretting("......",spr_title_greetingcharacter_close_eyes);
			scr_text_gretting("Oh, here you are.",spr_title_greetingcharacter_close_one_eye);
			scr_text_gretting("It seems the connection is successful.",spr_title_greetingcharacter);
			scr_text_gretting("...",spr_title_greetingcharacter_close_eyes);
			scr_text_gretting("Before we get started, I want to check out if there's anything else you want to do.",spr_title_greetingcharacter);
			scr_text_gretting("Welcome to the DECIMAL world. You can change some setting if you like.",spr_title_greetingcharacter);
			*/
			scr_text_gretting("......",spr_title_greetingcharacter_close_eyes);
			break;
		case 2:
			scr_play_bgm(mus_darkroom,0,82.28);
			/*
			scr_text_gretting("Ok, it seems you are ready.",spr_title_greetingcharacter_close_eyes);
			scr_text_gretting("Just want to remind you, this is a story...",spr_title_greetingcharacter);
			scr_text_gretting("... in the aspect of a kid, Alex.",spr_title_greetingcharacter);
			scr_text_gretting("In other words, your choice doesn't matter to the story.",spr_title_greetingcharacter);
			scr_text_gretting("So, let's begin.",spr_title_greetingcharacter_close_one_eye);
			*/
			scr_text_gretting("Ok, it seems you are ready.",spr_title_greetingcharacter_close_eyes);
			break;
	}
	with(obj_title_chatbubbles){
		greeting_now=1;
		init_flag=1;
		char_x[0]=x;
		char_y[0]=y;
		now_char=1;
	}
}