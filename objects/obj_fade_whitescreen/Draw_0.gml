/// @description 
timer ++;
if(timer == time){
	instance_destroy();
}

draw_set_alpha(timer/time);
draw_set_color(c_white);
draw_rectangle(-100,-100,1380,820,false);
draw_set_alpha(1);
