/// @description 
timer ++;
if(timer == time){
	instance_destroy();
}

draw_set_alpha(timer/time);
draw_set_color(c_white);
draw_rectangle(0,0,1280,720,false);
draw_set_alpha(1);
