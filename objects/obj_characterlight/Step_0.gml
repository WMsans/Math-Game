/// @description move light with player
if(instance_exists(obj_player)){
light[| eLight.X] = obj_player.x;
light[| eLight.Y] = obj_player.y;
}else{
	light[| eLight.X] =-999;
	light[| eLight.Y] =-999;
}
light[| eLight.Range]=lightrange;

lightrange+=lightspeed;