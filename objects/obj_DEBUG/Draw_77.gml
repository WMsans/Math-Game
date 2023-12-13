/// @description 
gpu_set_blendenable(false);

if(keyboard_check_pressed(global.keyesc)){
	if(!global.setting){
		instance_deactivate_all(1);
		pause_surf=surface_create(resw, resh);
		surface_set_target (pause_surf);
		draw_surface (application_surface,0,0);
		surface_reset_target();
		//Back up this surface to a buffer in case we lose it (screen focus, etc) if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);
		pause_surfbuffer = buffer_create(resw * resh * 4, buffer_fixed, 1); 
		buffer_get_surface (pause_surfbuffer, pause_surf, 0);
		instance_create_layer(-999,-999,"setting",obj_setting);
	}else{
		instance_destroy(obj_setting);
		instance_activate_all();
		if (surface_exists(pause_surf)) surface_free(pause_surf);
		if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);
	}
}

if (global.setting){ //draw frozen image to screen while paused

	surface_set_target(application_surface);
	if (surface_exists(pause_surf)) draw_surface(pause_surf,0,0); 
	else{ //restore from buffer if we lost the surface
		pause_surf = surface_create(resw, resh);
		buffer_set_surface(pause_surfbuffer, pause_surf,0);
	}
	surface_reset_target();
}
instance_activate_object(obj_setting);
gpu_set_blendenable(true);