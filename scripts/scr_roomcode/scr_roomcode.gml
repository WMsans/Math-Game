function scr_roomcode(){
	scr_fadein();
	if(!instance_exists(obj_DEBUG)){
		instance_create_layer(-999,-999,"Instances",obj_DEBUG);
	}
	if(!instance_exists(obj_item_mainbox)){
		instance_create_layer(-999,-999,"itembox",obj_item_mainbox);
	}
	if(!instance_exists(obj_camera)){
		instance_create_layer(global.target_x,global.target_y,"Instances",obj_camera);
	}
	if(!instance_exists(obj_player)){
		global.charainst[1]=instance_create_layer(global.target_x,global.target_y,"Instances",obj_player);
	}
	if(!instance_exists(obj_drawsorter)){
		instance_create_layer(-999,-999,"Instances",obj_drawsorter);
	}
	while (ds_list_size(global.trigger_enemy_list) > 0){
		ds_list_delete(global.trigger_enemy_list, 0);
    }
	
}