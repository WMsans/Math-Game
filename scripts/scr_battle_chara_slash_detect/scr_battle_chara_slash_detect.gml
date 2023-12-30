function scr_battle_chara_slash_detect(){
	mask_index=slashHB;
	var hitbyattacknow=ds_list_create();
	var hits=instance_place_list(x,y,obj_enemy_battle_par,hitbyattacknow,false);
	if(hits>0){
		for(var i=0;i<hits;i++){
			var hitid=hitbyattacknow[| i];
			if(ds_list_find_index(hitbyattack, hitid)==-1){
				ds_list_add(hitbyattack, hitid);
				with(hitid){//被砍的敌人做什么
					scr_battle_enemyhit(10);//10改为攻击力DEBUG
				}
			}
		}
	}
	ds_list_destroy(hitbyattacknow); 
	mask_index=sprite_index;
}
