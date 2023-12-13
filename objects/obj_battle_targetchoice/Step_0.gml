/// @description 

if(state==1){
	x+=10;
}else if(state==0){
	x-=10;
}

if(fading){
	if(image_alpha>0) image_alpha-=0.05;
	else instance_destroy();
}