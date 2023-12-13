if(!instance_exists(obj_cutscene)){
	if(instance_exists(follow)){
		xTo=follow.x;
		yTo=follow.y;
	}
	//Update obj pos
//	x+=(xTo-x)/cam_speed;
//	y+=(yTo-y)/cam_speed;
	
	x =clamp(x+(xTo-x)/cam_speed, view_w_half+buff, room_width-view_w_half-buff);
	y= clamp(y+(yTo-y)/cam_speed, view_h_half+buff, room_height-view_h_half-buff);
	
	//Shake
	x+=random_range(-shake_remain,shake_remain);
	y+=random_range(-shake_remain,shake_remain);
	shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));
	//Update cam pos
	camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
	
}