/// @description 
if(obj_battle.battle_button_state==BATTLE_BUTTON_STATE.act_menu||obj_battle.battle_button_state==BATTLE_BUTTON_STATE.fight_menu||obj_battle.battle_button_state==BATTLE_BUTTON_STATE.item_menu||obj_battle.battle_button_state==BATTLE_BUTTON_STATE.mercy_menu||obj_battle.battle_button_state==BATTLE_BUTTON_STATE.act_choice||obj_battle.battle_state!=BATTLE_STATES.player||obj_battle.battle_button_state==BATTLE_BUTTON_STATE.item_use_choice){
	substract_y+=(0-substract_y)/10;
}else{
	substract_y+=(200-substract_y)/10;
}
draw_set_font(fnt_init);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
if(obj_battle.battle_button_state==BATTLE_BUTTON_STATE.item_menu){//item info
	draw_text_ext(18,536+substract_y,global.itemdata_des[global.item[obj_battle.battle_item_choice[obj_battle.battle_chara_now]]]+"\n"+global.itemdata_des_eff[global.item[obj_battle.battle_item_choice[obj_battle.battle_chara_now]]],string_height("K"),450);
}else if(obj_battle.battle_button_state==BATTLE_BUTTON_STATE.item_use_choice){//selecting chara info
	var selecting_chara=obj_battle.battle_action_choice[obj_battle.battle_chara_now];
	draw_text(18,536+substract_y,global.charaname[selecting_chara]);
	draw_text(18,536+string_height("K")+substract_y,"HP: "+string(global.charahp[selecting_chara])+"/"+string(global.charamaxhp[selecting_chara]));
	draw_text(18,536+string_height("K")*2+substract_y,"Energy: "+string(obj_battle.character_inst[selecting_chara].energy)+"/100");
}
else{//charanow info
	draw_text(18,536+substract_y,global.charaname[obj_battle.battle_chara_now]);
	draw_text(18,536+string_height("K")+substract_y,"HP: "+string(global.charahp[obj_battle.battle_chara_now])+"/"+string(global.charamaxhp[obj_battle.battle_chara_now]));
	draw_text(18,536+string_height("K")*2+substract_y,"Energy: "+string(obj_battle.character_inst[obj_battle.battle_chara_now].energy)+"/100");
}
