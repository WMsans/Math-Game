/// @description 
draw_self();
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_set_font(fnt_enemy_dialog);
var now_sentence=obj_title_greetingcharacter.greeting_sentence[greeting_now];
var len=string_length(now_sentence);
if(init_flag){
	init_flag=0;
	now_char=1;
	text_pause_timer=0;
	//加载char_x
	for(var i=1;i<=len;i++){
		var _nowchar=string_char_at(now_sentence,i);
		char_x[i]=char_x[i-1]+string_width(string_char_at(now_sentence,i-1));
		char_y[i]=char_y[i-1];
		if(_nowchar==" "){//New word
			//if the word need to return
			var j=i+1;
			while(string_char_at(now_sentence,j)!=" "&&j!=len) j++;
			j--;
			if(string_width(string_copy(now_sentence,i,j-i+1))+char_x[i]>max_width+x){//换行
				char_y[i]+=string_height(string_char_at(now_sentence,i));
				char_x[i]=x;
			}
		}
	}
}

//draw chars
for(var i=1;i<=now_char;i++){
	draw_text(char_x[i],char_y[i],string_char_at(now_sentence,i));
}
if(text_pause_timer==0){//停顿字符
	if(now_char!=len){
		now_char=clamp(now_char+txt_speed,0,len);
		if(!audio_is_playing(snd_txt_init)) audio_play_sound(snd_txt_init,0,0);//play sound
	}
	if((string_char_at(now_sentence,now_char)=="."||string_char_at(now_sentence,now_char)==","||string_char_at(now_sentence,now_char)=="?"||string_char_at(now_sentence,now_char)=="!")&&now_char<len) text_pause_timer=text_pause_time;
	
}else{
	text_pause_timer--;
	
}


//下一句
if(now_char==len&&greeting_now<obj_title_greetingcharacter.greeting_sentencenum){//可以下一句
	if(keyboard_check_pressed(global.keyz)){
		greeting_now++;
		init_flag=1;
	}
}