//set for the target pos
tarx=obj_skillchange.arrow_tarx;
tary=obj_skillchange.arrow_tary;
//animate the moving
if(x==-999||y==-999){
	x=tarx;
	y=tary;
}else{
	x+=(tarx-x)/3;
	y+=(tary-y)/3;
}