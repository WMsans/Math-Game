/// @description 
if(scr_enemy_dialog_size()>0){
	if(!instance_exists(inst)){
		alarm[0]=1;
	}
}else{
	if(!instance_exists(inst)){
		instance_destroy();
	}
}