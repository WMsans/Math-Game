/// @description move light with player
if(instance_exists(obj_textblock_arrow)){
	light[| eLight.X] = obj_textblock_arrow.x;
	light[| eLight.Y] = obj_textblock_arrow.y;
}else if(instance_exists(obj_skillchange_arrow)){
	light[| eLight.X] = obj_skillchange_arrow.x;
	light[| eLight.Y] = obj_skillchange_arrow.y;
}else if(instance_exists(obj_itembox_arrow)){
	light[| eLight.X] = obj_itembox_arrow.x;
	light[| eLight.Y] = obj_itembox_arrow.y;
}
else{
	light[| eLight.X] =-999;
	light[| eLight.Y] =-999;
}
light[| eLight.Range]=lightrange;

lightrange+=lightspeed;