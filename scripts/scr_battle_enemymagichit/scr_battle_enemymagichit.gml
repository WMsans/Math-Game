function scr_battle_enemymagichit(_hitpoint){
	flashalpha=1;
	flashcolor=c_yellow;
	if(magic_hp-_hitpoint==0){
		obj_battle.booty_coin+=coin;
		obj_battle.booty_EXP+=EXP;
		instance_destroy();//以后在这里添加死亡动画 debug
	}else if(magic_hp-_hitpoint<0){
		event_user(4);//强化
	}else{
		magic_hp-=_hitpoint;
	}
}