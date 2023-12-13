if(keyboard_check_pressed(global.keyright)&&select>6&&select<=12){
	select=999;
	tarx=1016;
	tary=20;
}else 
if(keyboard_check_pressed(global.keydown)&&select<=11){
	select++;
}else
if(keyboard_check_pressed(global.keyup)&&select!=1&&select<=12){
	select--;
}else
if(keyboard_check_pressed(global.keyright)&&select<=6){
	select+=6;
}else
if(keyboard_check_pressed(global.keyleft)&&select>6&&select<=12){
	select-=6;
}else
if((keyboard_check_pressed(global.keydown)||keyboard_check_pressed(global.keyleft))&&select==999){
	select=7;
}

if(select<=6){
	tarx=24;
	tary=128+(select-1)*96-32;
}else if(select!=999){
	tarx=630;
	tary=128+(select-7)*96-32;
}

//animate the moving
if(x==0||y==0){
	x=tarx;
	y=tary;
}else{
	x+=(tarx-x)/4;
	y+=(tary-y)/4;
}