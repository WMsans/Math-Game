if(char_index<=string_length(text)){
	if(time>=text_spd){
		var char=string_char_at(text,char_index);
		if(char==" "){//calculate next word len
			var pos=char_index+1;
			var len=string_length(text);
			while(string_char_at(text,pos)!=" "&&pos<=len){
				pos++;
			}
			now_word_len=string_width(string_copy(text,char_index+1,pos-char_index));
			if(x+char_x+now_word_len>=char_edge_x){//换行
				char_y+=string_height(char);
				char_x=0;
				char_index++;
				char=string_char_at(text,char_index);
			}
		}
		if(char=="|"){
			char_y+=string_height(char);
			char_x=0;
		}else{
			if(x+char_x+string_width(char)>=char_edge_x){//换行
				char_y+=string_height(char);
				char_x=0;
			}
			
			//多实例打字机
			var inst=instance_create_layer(x+char_x,y+char_y,"setting",obj_battle_char);
			inst.text=string_char_at(text,char_index);
			inst.text_fnt=text_fnt;
			inst.text_color=text_color;
	
			time=0;
			ds_list_add(char_list,inst);
			draw_set_font(text_fnt);
			char_x+=string_width(char);
		}
		char_index++;
		
	}else{
		time++;
	}
}else{
	if(can_destroy){
		if(keyboard_check_pressed(global.keyz)){
			instance_destroy();
		}
	}
}
