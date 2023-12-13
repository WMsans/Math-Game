function scr_item_ordinaryhammer(){
	if(room!=rm_battle){//没有战斗，正常执行
	if(global.charaname[selected_character]=="Natasha"){
		scr_item_remove(selected_item1);
		scr_item_add(5);
		global.charaweapon[selected_character]=5;
	}
	}
}