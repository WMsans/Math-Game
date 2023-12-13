function scr_item_banana(){
	if(room!=rm_battle){
		scr_create_chatbox("banana");
		scr_charahp_plus(argument0,20);
		scr_item_remove(selected_item1);
	}else{//battle scripts
		scr_ui_dialog_create("You eat an apple!");
		scr_ui_dialog_create("You feel...banana.");
		scr_charahp_plus(argument0,20);
		obj_battle.battle_ui_dialog=scr_create_text(432+15+5,520+16,"setting",scr_ui_dialog_get()){
			obj_battle.battle_ui_dialog.can_destroy=1;
		}
	}
}