function scr_enemy_preset(_battle_id,_pos){
	switch(_battle_id){
		case 0:
			game_restart();
		case 1:
			if(_pos==1)
			return obj_enemy_battle;
	}
}