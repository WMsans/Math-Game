function scr_battle_get_damage(_pos){
	if(!instance_exists(obj_battle_target_par)){
		return 0;
	}
	switch(global.charabattletarget[_pos]){//target类型
		case 1://物理攻击, 越接近中心伤害越高
			//获取Choice位置
			var _tar_choice=obj_battle.battle_targetchoice_inst.x;
			var _tar=obj_battle.battle_target_inst.x;
			var _total_len=obj_battle.battle_target_inst.sprite_width/2;
			var _tar_enemy=scr_enemy_get(obj_battle.battle_menu_choice[_pos]-1);
			return (_total_len-abs(_tar-_tar_choice))/_total_len*global.charaattack[_pos];
			break;
		case 2://自然数攻击, 越接近中心伤害越高
			//获取Choice位置
			/*var _tar_choice=obj_battle.battle_targetchoice_inst.x;
			var _tar=obj_battle.battle_target_inst.x;
			var _total_len=obj_battle.battle_target_inst.sprite_width/2;
			var _tar_enemy=scr_enemy_get(obj_battle.battle_menu_choice[_pos]-1);
			return (_total_len-abs(_tar-_tar_choice))/_total_len*min(global.charamagicattack[_pos],_tar_enemy.magic_hp);*/
			var _tar_choice=obj_battle.battle_targetchoice_inst.x;
			var _tar=obj_battle.battle_target_inst;
			if(_tar_choice<=510){
				return _tar.numbers[1];
			}
			if(_tar_choice<=597) return _tar.numbers[2];
			if(_tar_choice<=690) return _tar.numbers[3];
			if(_tar_choice<=780) return _tar.numbers[4];
			if(_tar_choice<=930) return _tar.numbers[5];
			if(_tar_choice<=1020) return _tar.numbers[6];
			if(_tar_choice<=1113) return _tar.numbers[7];
			if(_tar_choice<=1200) return _tar.numbers[8];
			return _tar.numbers[9];
			break;
	}
}