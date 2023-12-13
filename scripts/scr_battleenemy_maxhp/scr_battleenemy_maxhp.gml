function scr_battleenemy_maxhp(_battle_id,_pos){
	switch(_battle_id){
		case 0:
			game_restart();
		case 1:
			return 100;
	}
}