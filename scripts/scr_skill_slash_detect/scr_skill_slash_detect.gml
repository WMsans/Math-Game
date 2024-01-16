function scr_skill_slash_detect(){
	mask_index=slashHB;
	var hitbyattacknow=ds_list_create();
	var hits=instance_place_list(x,y,obj_block,hitbyattacknow,false);
	if(hits>0){
		for(var i=0;i<hits;i++){
			var hitid=hitbyattacknow[| i];
			if(ds_list_find_index(hitbyattack, hitid)==-1){
				ds_list_add(hitbyattack, hitid);
				with(hitid){//被砍的东西做什么
					scr_hit_by_skillslash();
				}
			}
		}
	}
	ds_list_destroy(hitbyattacknow); 
	mask_index=sprite_index;

}