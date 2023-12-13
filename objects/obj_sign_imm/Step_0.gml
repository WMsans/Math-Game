if(place_meeting(x,y,obj_player)){
	if(!global.talking && !touch_r) scr_create_chatbox(sign_id);
	touch_r=1;
}else touch_r=0;
