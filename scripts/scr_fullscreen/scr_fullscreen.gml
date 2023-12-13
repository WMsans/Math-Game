function scr_fullscreen(){
	switch(argument0){
		case 0:
			window_set_fullscreen(1);
			break;
		case 1:
			window_set_fullscreen(0);
			break;
		
	}
}