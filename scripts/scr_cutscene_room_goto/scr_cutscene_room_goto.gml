///@arg room_index
///@arg target_x
///@arg target_y
///@arg fade?
function scr_cutscene_room_goto(_rm, _tarx, _tary,_fade){
	if(_fade){
		scr_fadeout(_rm, _tarx, _tary);
	}else{
		global.target_x = _tarx;
		global.target_y = _tary;
		room_goto(_rm);
	}
	if(instance_exists(obj_cutscene)) scr_cutscene_end_action();
}