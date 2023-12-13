function scr_enemy_add(_enemy_obj){
	if(ds_list_size(obj_battle.enemy_list)<3){
		inst=instance_create_layer(0,0,"enemy",_enemy_obj);
		
		ds_list_add(obj_battle.enemy_list,inst);
		return inst;
	}else return noone;
	
}