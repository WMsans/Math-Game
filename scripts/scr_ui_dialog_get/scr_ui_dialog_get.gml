function scr_ui_dialog_get(){
	return ds_queue_dequeue(global._battle_dialog);
}