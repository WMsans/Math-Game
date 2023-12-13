function scr_create_chatbox(_text_id){
	with(instance_create_layer(x,y,"textbox",obj_chatbox)){
		scr_game_txt(_text_id);
		
		if(argument_count>1){
			camx=argument[1];
			camy=argument[2];
		}else{
			camx=obj_camera.x;
			camy=obj_camera.y;
		}
		
	}
}