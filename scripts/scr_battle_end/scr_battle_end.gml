
function scr_battle_end(show_booty){
	if(show_booty){
		scr_ui_dialog_create("You win! You earned "+string(obj_battle.booty_coin)+" coins and "+string(obj_battle.booty_EXP)+" EXP!");
		global.gold+=obj_battle.booty_coin;
		
	}
	global.fighting=0;
	with(obj_battle) {battle_state=BATTLE_STATES.encounter_text;}
	
}