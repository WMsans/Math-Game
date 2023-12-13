function scr_cutscene_text(_txt_id){
	if(!instance_exists(obj_chatbox)) scr_create_chatbox(_txt_id);
}