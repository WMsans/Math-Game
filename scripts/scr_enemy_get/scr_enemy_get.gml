function scr_enemy_get(_pos){
	return ds_list_find_value(obj_battle.enemy_list,_pos);
}