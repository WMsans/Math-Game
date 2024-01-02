function scr_target_naturalnumber(){
	//这是自然数攻击的模板。 
	soul_tarx=-999;
	soul_tary=-999;
	
	if(battle_targetchoice_inst.state==0){
		if(battle_targetchoice_inst.x<442){
			battle_targetchoice_inst.state=1;
		}
	}else if(battle_targetchoice_inst.state==1){
		if(battle_targetchoice_inst.x>1280){
			battle_targetchoice_inst.state=0;
		}
	}
	if(battle_target_time>=battle_target_maxtime){//限时
		vis_fight[battle_fight_nowpos]=1;
		
		battle_targetchoice_inst.state=-1;
		while(vis_fight[battle_fight_nowpos]||button_choice[battle_fight_nowpos]!=1){
			if(battle_fight_nowpos<global.charanum){
				battle_fight_nowpos++;
				battle_target_resetable=1;
				battle_target_resettime=battle_target_resettimer;//等待1秒
			}else{
				battle_button_state=BATTLE_BUTTON_STATE.fight_anim;
				battle_target_resetable=0;
				battle_target_resettime=0;
				break;
			}
		}
		
		//删除target
		battle_target_inst.fading=1;
		battle_targetchoice_inst.fading=1;
	}else battle_target_time++;
	
	if(keyboard_check_pressed(global.keyz)){
		//play sound
		
		battle_targetchoice_fade_inst=instance_create_layer(battle_targetchoice_inst.x,battle_targetchoice_inst.y,"anim",obj_battle_targetchoice_fade);//生成动画
		battle_targetchoice_fade_inst.sprite_index=battle_targetchoice_inst.sprite_index;
		
		if(battle_chara_fighting_count<fight_using){//攻击一次
			//记录攻击数值
			battle_magicdamage[battle_menu_choice[battle_fight_nowpos]]+=scr_battle_get_damage(battle_fight_nowpos);
			
			battle_chara_fighting_count++;
			battle_chara_fighting_count_real++;
		}
		//攻击结束
		
		vis_fight[battle_fight_nowpos]=1;
		
		battle_targetchoice_inst.state=-1;
		while(vis_fight[battle_fight_nowpos]||button_choice[battle_fight_nowpos]!=1){
			if(battle_fight_nowpos<global.charanum){
				battle_fight_nowpos++;
				battle_target_resetable=1;
				battle_target_resettime=battle_target_resettimer;//等待1秒
			}else{
				battle_button_state=BATTLE_BUTTON_STATE.fight_anim;
				battle_target_resetable=0;
				battle_target_resettime=0;
				break;
			}
		}
		
		battle_fight_anim_time=sprite_get_number(battle_fight_anim.sprite_index)*10;
		//删除target
		battle_target_inst.fading=1;
		battle_targetchoice_inst.fading=1;
			
	}
}