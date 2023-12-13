///@arg x
///@arg y
///@arg name
///@arg maxhp
///@arg weapon
///@arg armor
///@arg spr index
///@arg slash spr
///@arg 
function scr_cutscene_follower_create(){
	var _inst = instance_create_layer(argument0,argument1,"Instances",obj_follower);
	scr_chara_join_team(argument2,argument3,argument4,argument5,argument6,argument7);
	global.charainst[global.charanum]=_inst;
	with(_inst){
		chara_num=global.charanum;
		scr_load_character_spr(chara_num);
		switch(obj_player.follower_face[record*(chara_num-1)]){
			case -1:
				image_xscale=1;
				sprite_index=spr;
				break;
			case 1:
				image_xscale=1;
				sprite_index=sprback;
				break;
			case 2:
				image_xscale=-1;
				sprite_index=sprside;
				break;
			case -2:
				image_xscale=1;
				sprite_index=sprside;
				break;
		}
	}
	
	scr_cutscene_end_action();
	return _inst;
}