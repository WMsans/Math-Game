function scr_play_bgm(_bgm, _into_len,_loop_len){
	if(instance_exists(obj_bgm)){
		if(obj_bgm.bgm_id==_bgm) return obj_bgm;
		scr_new_bgm(_bgm, _into_len,_loop_len);
		
	}else{
		var _con=instance_create_layer(-999,-999,"Instances",obj_bgm);
		with(_con){
			bgm=audio_play_sound(_bgm,1000,0);
			bgm_id=_bgm;
			into_len=_into_len;
			loop_len=_loop_len;
			total_len=into_len+loop_len;
		}
		return _con;
	}
	obj_bgm.into_new_room = false;
}