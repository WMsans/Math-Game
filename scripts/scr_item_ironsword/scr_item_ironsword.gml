///@arg chara_pos
///@arg item_pos
function scr_item_ironsword(){
	if(room!=rm_battle){//没有战斗，正常执行
		if(global.charaname[selected_character]=="Alex"){
			scr_item_remove(selected_item1);
			scr_item_add(global.charaweapon[selected_character]);
			global.charaweapon[selected_character]=6;
			scr_create_chatbox("iron_sword");
			global.charabattletarget[selected_character]=2;//设置target类型
		}
	}else{
		scr_ui_dialog_create("You equipped a iron sword!");
		scr_item_remove(argument[1]);
		scr_item_add(global.charaweapon[argument[0]]);
		global.charaweapon[argument[0]]=6;
		global.charabattletarget[argument[1]]=2;//设置target类型
		obj_battle.battle_ui_dialog=scr_create_text(432+15+5,520+16,"setting",scr_ui_dialog_get()){
			obj_battle.battle_ui_dialog.can_destroy=1;
		}
	}
}