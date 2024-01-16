///@arg chara_pos
///@arg item_pos
function scr_item_woodensword(){
	if(room!=rm_battle){//没有战斗，正常执行
		if(global.charaname[selected_character]=="Alex"){
			if(global.charaweapon[selected_character]==7){//添加技能
				scr_skill_add(selected_character,2);
			}else scr_item_add(global.charaweapon[selected_character]);
			scr_item_remove(selected_item1);
			global.charaweapon[selected_character] = 3;
			global.charaattack[selected_character] = 10;
		}else if(global.charaname[selected_character]=="Natasha"){
			scr_create_chatbox("woodensword-Natasha");
		}
	}else{
		scr_ui_dialog_create("You equipped a wooden sword!");
		scr_item_remove(argument[1]);
		if(global.charaweapon[argument[0]] != 7)
			scr_item_add(global.charaweapon[argument[0]]);
		global.charaweapon[argument[0]] = 3;
		global.charaattack[argument[0]] = 10;
		obj_battle.battle_ui_dialog=scr_create_text(432+15+5,520+16,"setting",scr_ui_dialog_get()){
			obj_battle.battle_ui_dialog.can_destroy=1;
		}
	}
}