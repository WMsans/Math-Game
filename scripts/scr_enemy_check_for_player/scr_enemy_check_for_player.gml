function scr_enemy_check_for_player(){
	var _dis=distance_to_object(obj_player);
	if((_dis<alart_dist||alart)&&_dis>attack_dis){
		alart=true;
		
		if(!calc_path_timer--){
			calc_path_timer=calc_path_delay;
			//can I make a path to the player
			var _found_player=mp_grid_path(global.mp_grid,path,x,y,obj_player.x,obj_player.y,1);
			if(_found_player){
				path_start(path,move_spd,path_action_stop,0);
			}
				
		}
		if(global.setting||instance_exists(obj_cutscene)||global.skill_setting||instance_exists(obj_fade)||instance_exists(obj_chatbox)||(instance_exists(obj_item_mainbox)&&obj_item_mainbox.showing)||instance_exists(obj_savebox)){
			path_end();
		}
		
	}else{
		if(_dis<attack_dis){
			global.trigger_enemy=id;
			ds_list_add(global.trigger_enemy_list,id);
			scr_battle_start(enemy_id);
			path_end();
		}
	}
}