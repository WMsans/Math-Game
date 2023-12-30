function scr_text_set_init(){
	line_break_pos[0,page_num]=999;
	line_break_num[page_num]=0;
	line_break_offset[page_num]=0;
	
	for(var i=0;i<999;i++){
		col_1[i][page_num]=c_white;
		col_2[i][page_num]=c_white;
		col_3[i][page_num]=c_white;
		col_4[i][page_num]=c_white;
		
		/*option_color1[i][option_num]=c_white;
		option_color2[i][option_num]=c_white;
		option_color3[i][option_num]=c_white;
		option_color4[i][option_num]=c_white;*/
		
		float_text[i][page_num]=0;
		float_dir[i][page_num]=i*20;//each letter's difference
		
		shake_text[i][page_num]=0;
		shake_txt_dir[i][page_num]=irandom(360);
		shake_txt_timer[i][page_num]=irandom(4);
	}
	
	txtb_spr[page_num]=spr_chatbox_init2;
	speaker_spr[page_num]=noone;
	speaker_side[page_num]=1;
	
	snd[page_num]=snd_txt_init;
	fnt[page_num] = fnt_init;
}