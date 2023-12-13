///@arg 边界x值
///@arg 打字机实例id
function scr_ui_dialog_setedge(){
	if(argument_count>1){
		if(instance_exists(argument[1])){
			argument[1].char_edge_x=argument[0];
			return true;
		}
	}else{
		if(instance_exists(obj_battle_text)){
			obj_battle_text.char_edge_x=argument[0];
			return true;
		}
	}
	return false;
}