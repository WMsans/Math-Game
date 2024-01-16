function scr_battlingskill_init(_pos){
	if(global.charaskillnum[_pos]==0) return false;
	switch(global.charaskill[_pos][global.charanowskill]){
		case 1://aleX 冲刺
			skill_cool=10;
			skill_tarx=-999;
			skill_tary=-999;
			break;
		case 2://aleX 十字划
			skill_cool=75;
			skill_flag=1;
			break;
	}
	skill_cool_timer=skill_cool;
	return true;
}