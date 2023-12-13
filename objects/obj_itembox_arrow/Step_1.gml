/// @description Destroy the object
if(instance_exists(obj_item_mainbox)){
	if(!obj_item_mainbox.showing) instance_destroy();
}else instance_destroy();