sign_id="dirtybed";

if(variable_global_exists("bedcleaned")){
	var _clean=instance_create_layer(x,y,"Instances",obj_cleanbed);
	_clean.sign_id="cleanbed";
	instance_destroy();
}