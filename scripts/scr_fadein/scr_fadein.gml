///@arg fadeinrate
function scr_fadein(){
	if(!instance_exists(obj_fade)){
		if(argument_count==0) instance_create_layer(0,0,"fade",obj_fade);
		if(argument_count==1) with(instance_create_layer(0,0,"fade",obj_fade)){
			fadeinrate=argument0;
		}
	}
}