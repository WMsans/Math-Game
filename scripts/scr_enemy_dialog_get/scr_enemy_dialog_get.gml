function scr_enemy_dialog_get(){
	return ds_queue_dequeue(global._enemy_dialog);
}