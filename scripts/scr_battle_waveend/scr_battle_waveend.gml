function scr_battle_waveend(){
	with(obj_battle){
		if(battle_state==BATTLE_STATES.enemy){
			battle_state=BATTLE_STATES.fight_post_text;
			with(obj_character_battle){
				guiwei=true;
			}
		}
		battle_chara_now=0;
		for(var i=1;i<=global.charanum;i++) battle_menu_choice[i]=1;//选择的怪物
		for(var i=1;i<=global.charanum;i++) battle_action_choice[i]=1;//选择的ACT
		for(var i=1;i<=global.charanum;i++) battle_item_choice[i]=1;//选择的物品
		battle_chara_fighting=1;
		battle_chara_now=1;
		battle_chara_fighting_count=0;

		wave_inst=noone;
		battle_fight_anim=noone;
		
		item_using=0;
		act_using=0;
		fight_using=0;
		mercy_using=0;
		
		battle_target_time=0;
	}
	with(obj_wave){
		instance_destroy();
	}
	with(obj_bullet_par){
		instance_destroy();
	}
}