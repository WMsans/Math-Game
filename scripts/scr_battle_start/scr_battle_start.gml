function scr_battle_start(_enemy_id){
	global.target_rm=room;
	global.fighting=1;
	global.next_enemy_id=_enemy_id;
	scr_fadeout(rm_battle,-999,-999);
	global.target_x=obj_player.x;
	global.target_y=obj_player.y;
}