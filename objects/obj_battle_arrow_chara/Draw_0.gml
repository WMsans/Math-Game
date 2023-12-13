//set the angle
if(!state){//下落
	buf_y+=spd;
	spd+=0.0001;
}else{//上升
	buf_y-=spd;
	spd-=0.0001;
}
if(buf_y>=10){
	state=!state;
	buf_y=9.9999;
}
if(buf_y<=0){
	state=!state;
	buf_y=0;
}

draw_sprite_ext(sprite_index,image_index,x,y+buf_y,image_xscale,image_yscale,0,c_white,0.7);
