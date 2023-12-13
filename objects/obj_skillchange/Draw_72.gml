/// @description destroy the object
if(keyboard_check_released(global.keya)){
	global.charanowleader=_charanowleader;
	global.charanowskill=_charanowskill;
	#region 设置新leader
	//重载obj_player的spr
	with(obj_player){
		scr_load_character_spr(global.charanowleader);
		scr_battlingskill_init(global.charanowleader);
	}
	//重载obj_follower的spr
	if(global.charanowleader==1){
		for(var i=2;i<=global.charanum;i++){
			with(global.charainst[i]){
				scr_load_character_spr(i);
			}
		}
	}else{
		for(var i=2;i<=global.charanum;i++){
			if(i==global.charanowleader){
				with(global.charainst[i]){
					scr_load_character_spr(1);
				}
			}else{
				with(global.charainst[i]){
					scr_load_character_spr(i);
				}
			}
		}
	}
	#endregion
	
	instance_destroy();
}