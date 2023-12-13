function scr_create_text(_x,_y,_layer,_string){
	var text_inst=instance_create_layer(_x,_y,_layer,obj_battle_text);
	text_inst.text=_string;
	return text_inst;
}