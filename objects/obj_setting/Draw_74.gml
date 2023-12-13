/*if(instance_exists(obj_camera)){
	x=obj_camera.x;
	y=obj_camera.y;
}else{
	var box_x=camera_get_view_x(view_camera[0]);
	var box_y=camera_get_view_y(view_camera[0]);
	x=box_x+camera_get_view_width(view_camera[0])/2-32;
	y=box_y+camera_get_view_height(view_camera[0])/2-32;
}*/
x=camera_get_view_width(view_camera[0])/2-32;
y=camera_get_view_height(view_camera[0])/2-32;
