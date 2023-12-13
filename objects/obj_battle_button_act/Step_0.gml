if(obj_battle.battle_state==BATTLE_STATES.player&&obj_battle.battle_button_state==BATTLE_BUTTON_STATE.button_choice&&obj_battle.button_choice[obj_battle.battle_chara_now]==2){//player's round
	image_index=1;
	tarscale=1.1;
	obj_battle.soul_tarx=x;
	obj_battle.soul_tary=y;
}else{
	image_index=0;
	tarscale=1;
}

image_xscale+=(tarscale-image_xscale)/5;
image_yscale+=(tarscale-image_yscale)/5;
if(obj_battle.battle_button_state==BATTLE_BUTTON_STATE.button_choice&&obj_battle.battle_state==BATTLE_STATES.player){
	substract_y+=(0-substract_y)/10;
}else{
	substract_y+=(200-substract_y)/10;
}
