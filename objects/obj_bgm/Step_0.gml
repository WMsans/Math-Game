/// @description 

var _pos=audio_sound_get_track_position(bgm);
if(_pos>total_len){
	audio_sound_set_track_position(bgm,_pos-loop_len);
	
}
if(audio_sound_get_gain(bgm)<=0){
	audio_stop_sound(bgm);
	if(audio_exists(new_bgm)){
		bgm= audio_play_sound(new_bgm,1000,0);
		bgm_id=new_bgm;
		new_bgm=noone;
		into_len=new_into_len;
		new_into_len=0;
		loop_len=new_loop_len;
		new_loop_len=0;
		total_len=into_len+loop_len;
	}
}