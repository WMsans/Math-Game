

if(tarx==-999&&tary==-999){
	image_xscale+=(0-image_xscale)/5;
	image_yscale+=(0-image_yscale)/5;
}else{
	//animate the moving
	if(x==-999||y==-999){
		x=tarx;
		y=tary;
	}else{
		x+=(tarx-x)/5;
		y+=(tary-y)/5;
	}
	image_xscale+=(1-image_xscale)/5;
	image_yscale+=(1-image_yscale)/5;
}