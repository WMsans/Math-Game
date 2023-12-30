function scr_load_character_spr(_pos){
	switch(global.charaspr[_pos]){
		case 1://Alex
			spr= spr_king;
			sprwalk=spr_king_walk;
			sprside=spr_king;
			sprsidewalk=spr_king_walk;
			sprback=spr_king;
			sprbackwalk=spr_king_walk;
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