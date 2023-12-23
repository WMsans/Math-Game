///@arg Battle_id
///@arg Position
function scr_battleenemyspr(_battle_id,_pos){
	switch(_battle_id){
		case 1:
			idle=spr_enemy_prototype_f;
			walk=spr_enemy_prototype_f_walk;
			slash=spr_enemy_prototype_f;
			hurt=spr_enemy_prototype_f;
			return idle;
	}
}