function scr_battleenemy_init(_battle_id,_pos){
	scr_battle_init_charay();
	pos=_pos;
	scr_battleenemyspr(_battle_id,_pos);
	x=1120;
	y=init_chara_y[_pos];
//	name=scr_battleenemy_name(_battle_id,_pos);
	
//	maxhp=scr_battleenemy_maxhp(_battle_id,_pos);
//	max_magic_hp=scr_battleenemy_max_magic_hp(_battle_id,_pos);
}