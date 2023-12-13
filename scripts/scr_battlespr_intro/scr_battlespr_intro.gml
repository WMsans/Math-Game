function scr_battlespr_intro(_pos){
	switch(global.charaspr[_pos]){
		case 1://Alex
			return spr_player_battle_intro;
			break;
		case 2://Natasha
			return spr_player_battle_intro;
			break;
	}
}