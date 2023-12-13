function scr_enemy_delete(_pos){
	var _enemy_list=obj_battle.enemy_list;
	if(instance_exists(ds_list_find_value(_enemy_list,_pos))){
		var inst = ds_list_find_value(_enemy_list,_pos);
		ds_list_delete(_enemy_list,_pos);
		instance_destroy(inst);
		return true;
	}else return false;
}