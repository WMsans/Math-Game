function scr_skill_add(_pos,_skill_idx){
	global.charaskillnum[_pos]++;
	global.charaskill[_pos][global.charaskillnum[_pos]]=_skill_idx;
	if(instance_exists(obj_player)){
		obj_player.initflag=1;
	}
}