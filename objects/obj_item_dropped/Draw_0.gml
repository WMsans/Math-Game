//some animation
image_angle+=0.3;
if(nowscale!=tarscale){
	nowscale+=sign(tarscale-nowscale)*0.005;
}else{
	if(tarscale==1) tarscale=0.8;
	else tarscale=1;
}

draw_sprite_ext(sprite_index,image_index,x,y,nowscale,nowscale,image_angle,image_blend,image_alpha);
