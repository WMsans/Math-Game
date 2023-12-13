///@arg chara_pos
///@arg damage_value
///@arg inv 
function scr_chara_hurt(_pos,_damage){
	var _inv=50;
	if(argument_count>2) _inv=argument[2];
	
	if(instance_exists(obj_battle)){
		if(obj_battle.character_inst[_pos].inv==0){
			global.charahp[_pos]-=_damage;
			obj_battle.character_inst[_pos].inv=_inv;
			obj_battle.character_inst[_pos].flashalpha=1;
		}
	}else{
		if(global.charainst[_pos].inv==0){
			global.charahp[_pos]-=_damage;
			global.charainst[_pos].inv=_inv;
			global.charainst[_pos].flashalpha=1;
		}
	}
		
	//play sound
	
}