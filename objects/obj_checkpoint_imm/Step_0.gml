if(global.checkpoint_id == id){
	image_index=1;
}else{
	image_index=0;
	if(place_meeting(x,y,obj_player)){
		//scr_screenshake(5,30)
		
		global.checkpoint_rm=room;
		global.checkpoint_x=obj_player.x;
		global.checkpoint_y=obj_player.y;
		global.checkpoint_id=id;
		scr_savegame();
	}
}