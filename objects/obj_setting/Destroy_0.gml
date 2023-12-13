global.setting=0;
with(obj_DEBUG){
	instance_activate_all();
	if (surface_exists(pause_surf)) surface_free(pause_surf);
	if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);
}