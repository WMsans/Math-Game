/// @description 
if(fading){
	if(image_alpha>0) image_alpha-=0.05;
	else instance_destroy();
}else{
	image_alpha+=(1-image_alpha)/5;
}