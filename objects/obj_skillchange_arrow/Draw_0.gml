//set the angle
if(timer1<=0){
	if(abs(dir-angle1)<=sub){
		angle1=dir;
		dir=-dir;
	}else if(dir>0)
		angle1+=dir/(dir-angle1);
	else angle1-=dir/(dir-angle1);
	timer1=delay1;
	
}else timer1--;


draw_sprite_ext(sprite_index,image_index,x+24,y+24,image_xscale,image_yscale,angle1,c_white,0.7);