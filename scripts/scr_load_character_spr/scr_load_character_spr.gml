function scr_load_character_spr(_pos){
	switch(global.charaspr[_pos]){
		case 1://Alex
			spr=spr_player;
			sprwalk=spr_player_walk;
			sprside=spr_player_side;
			sprsidewalk=spr_player_sidewalk;
			sprback=spr_player_back;
			sprbackwalk=spr_player_backwalk;
			break;
		case 2://Natasha
			spr=spr_natasha;
			sprwalk=spr_natasha_walk;
			sprside=spr_natasha_side;
			sprsidewalk=spr_natasha_sidewalk;
			sprback=spr_natasha_back;
			sprbackwalk=spr_natasha_backwalk;
			break;
	}
}