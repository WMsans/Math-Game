/// @description damage player
if(place_meeting(x,y,obj_battle_arrow)){
	scr_chara_hurt(obj_battle.battle_chara_now,damage) 
	
}
if(!instance_exists(obj_wave)) instance_destroy();
