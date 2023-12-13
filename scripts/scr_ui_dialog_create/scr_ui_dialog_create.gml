/// @arg string
function scr_ui_dialog_create(_str){
//	obj_battle.battle_ui_dialog=scr_create_text(432+15+5,520+16,"setting",argument0){
//		obj_battle.battle_ui_dialog.can_destroy=1;
//	}
	ds_queue_enqueue(global._battle_dialog,_str);
}