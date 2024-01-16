/// @description 
if(trigger_plot < global.plot ){
	instance_destroy();
}

if(!instance_exists(obj_cutscene)){
	if(place_meeting(x,y,obj_player)&&global.plot == trigger_plot){
		scr_create_cutscene(t_scene_info);
		global.plot++;
		instance_destroy();
	}
}

