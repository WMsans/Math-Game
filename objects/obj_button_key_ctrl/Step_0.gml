if(obj_remapping_arrow.select==6){
	hover=1;
	if (obj_remapping_arrow.select==6 && keyboard_check_pressed(global.keyz)){
		
		if((!detecting_input_)&&(!global.detecting_input)){
			pressz=true;
			global.detecting_input=true;
		}
		
	}
} else{
	hover=0;
}

if(pressz&&!keyboard_check(global.keyz)) detecting_input_=1;
if(pressz) hover=true;

if(detecting_input_){
	text=detect_text;
	if(keyboard_key!=0){
		global.keyctrl=keyboard_key;
		text=keychecks(global.keyctrl);
		global.detecting_input=false;
		detecting_input_=false;
		pressz=0;
	}
}