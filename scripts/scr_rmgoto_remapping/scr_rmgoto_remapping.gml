function scr_rmgoto_remapping(){
	global.setting=0;
	if(instance_exists(obj_player)){
		global.target_x=obj_player.x;
		global.target_y=obj_player.y;
	}else{
		global.target_x=-999;
		global.target_y=-999;
	}
	global.target_rm=room;
	
	var fade= instance_create_layer(x,y,"fade",obj_fade);
	with(fade){
		a=0;
		fadeout=1;
		target_room=rm_remapping;
	}
	
}