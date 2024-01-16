function scr_battle_enemyhit(_hitpoint){
	flashalpha=1;
	flashcolor=c_white;
	if(hp-_hitpoint<=0){
		instance_destroy();//以后在这里添加死亡动画 debug
	}else{
		hp-=_hitpoint;
	}
	if(instance_exists(obj_battle)){
		obj_battle.battle_damage_cnt[pos] += _hitpoint;
	}
}