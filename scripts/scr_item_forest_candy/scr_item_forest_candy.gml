///@arg chara_pos
function scr_item_forest_candy(){
	if(room!=rm_battle){//没有战斗，正常执行
		scr_create_chatbox("Forest Candy");
		scr_charahp_plus(argument0,5);
		scr_item_remove(selected_item1);
	}else{//battle scripts
		scr_ui_dialog_create("You eat the candy wrapped by leaves.");
		if(global.candytook <= 1){
			scr_ui_dialog_create("You feel the faint scent of the forest in your mouth. You recovered 5 HP.");
		}else{
			scr_ui_dialog_create("You feel the past guilty in your mouth. You recovered 5 HP.");
		}
		scr_charahp_plus(argument0,5);
		obj_battle.battle_ui_dialog=scr_create_text(432+15+5,520+16,"setting",scr_ui_dialog_get()){
			obj_battle.battle_ui_dialog.can_destroy=1;
		}
	}
}