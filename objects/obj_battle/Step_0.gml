if(battle_state==BATTLE_STATES.player){
	if(battle_button_state==BATTLE_BUTTON_STATE.button_choice){
		//选择按键
		if(!instance_exists(obj_battle_arrow)) instance_create_layer(-999,-999,"soul",obj_battle_arrow);
		if(!instance_exists(obj_battle_arrow_chara)) instance_create_layer(-999,-999,"soul",obj_battle_arrow_chara);
		if(keyboard_check_pressed(global.keydown)&&button_choice[battle_chara_now]<=2) button_choice[battle_chara_now]+=2;
		if(keyboard_check_pressed(global.keyup)&&button_choice[battle_chara_now]>2) button_choice[battle_chara_now]-=2;
		if(keyboard_check_pressed(global.keyright)&&button_choice[battle_chara_now]<4) button_choice[battle_chara_now]+=1;
		if(keyboard_check_pressed(global.keyleft)&&button_choice[battle_chara_now]>1) button_choice[battle_chara_now]-=1;
		
		if(keyboard_check_pressed(global.keyz)){
			switch(button_choice[battle_chara_now]){
				case 1:
					battle_button_state=BATTLE_BUTTON_STATE.fight_menu;
					break;
				case 2:
					battle_button_state=BATTLE_BUTTON_STATE.act_menu;
					break;
				case 3:
					if(global.item_num) battle_button_state=BATTLE_BUTTON_STATE.item_menu;
					break;
				case 4:
					if(battle_chara_now==1) battle_button_state=BATTLE_BUTTON_STATE.mercy_menu;
					break;
			}
		}
		if(keyboard_check_pressed(global.keyx)&&battle_chara_now>1){
			battle_chara_now--;
			switch(button_choice[battle_chara_now]){
				case 1:
					battle_button_state=BATTLE_BUTTON_STATE.fight_menu;
					fight_using--;
					break;
				case 2:
					battle_button_state=BATTLE_BUTTON_STATE.act_menu;
					act_using--;
					break;
				case 3:
					battle_button_state=BATTLE_BUTTON_STATE.item_menu;
					item_using--;
					break;
				case 4:
					battle_button_state=BATTLE_BUTTON_STATE.mercy_menu;
					mercy_using--;
					break;
			}
		}
	}else if(battle_button_state==BATTLE_BUTTON_STATE.act_choice){
		if(keyboard_check_pressed(global.keyup)){
			if(battle_action_choice[battle_chara_now]>1) battle_action_choice[battle_chara_now]--;
			//play sound
		}
		if(keyboard_check_pressed(global.keydown)){
			if(battle_action_choice[battle_chara_now]<array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions)) battle_action_choice[battle_chara_now]++;
			//play sound
		}
		if(keyboard_check_pressed(global.keyx)){
			battle_button_state=BATTLE_BUTTON_STATE.act_menu;
		}
		if(keyboard_check_pressed(global.keyz)){
			act_using++;
/*			scr_enemy_get(battle_menu_choice[battle_chara_now]-1).action_index=battle_action_choice[battle_chara_now];
			with(scr_enemy_get(battle_menu_choice[battle_chara_now]-1)){
				event_user(1);
			}
			*/
//			battle_action_choice=0;
//			battle_menu_choice=0;
			if(battle_chara_now==global.charanum) {
				battle_state=BATTLE_STATES.encounter_text;
			}else{
				battle_chara_now++;
				battle_button_state=BATTLE_BUTTON_STATE.button_choice;
			}
			
		}
		//选择行动
		for(var i=1;i<=array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions);i++){
			choice_menu_tarx[i]=0;
			choice_menu_taralpha[i]=0;
		}
		
		if(array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions)<=3){//正常
			choice_menu_tary=0;
			for(var i=1;i<=3;i++) choice_menu_taralpha[i]=1;
			switch(battle_action_choice[battle_chara_now]){
				case 1:
					soul_tarx=432+15+5+15;
					soul_tary=520+16+24;
					choice_menu_tarx[1]=32;
					break;
				case 2:
					soul_tarx=432+15+5+15;
					soul_tary=520+16+36+24;
					choice_menu_tarx[2]=32;
					break;
				case 3:
					soul_tarx=432+15+5+15;
					soul_tary=520+16+72+24;
					choice_menu_tarx[3]=32;
					break;
			}
		}else{
			if(battle_action_choice[battle_chara_now]==1){
				soul_tarx=432+15+5+15;
				soul_tary=520+16+24;
				choice_menu_tarx[1]=32;
				choice_menu_tary=0;
				for(var i=1;i<=4;i++) choice_menu_taralpha[i]=1;
			}else if(battle_action_choice[battle_chara_now]==array_length(scr_enemy_get(battle_menu_choice-1).actions)-1){
				soul_tarx=432+15+5+15;
				soul_tary=520+16+72+24;
				choice_menu_tarx[array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions)-1]=32;
				choice_menu_tary=(battle_action_choice[battle_chara_now]-3)*36;
				for(var i=array_length(scr_enemy_get(battle_menu_choice-1).actions)-3;i<=array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions);i++) choice_menu_taralpha[i]=1;
			}else if(battle_action_choice==array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions)){
				soul_tarx=432+15+5+15;
				soul_tary=520+16+108+24;
				choice_menu_tarx[array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions)]=32;
				choice_menu_tary=(battle_action_choice-4)*36;
				for(var i=array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions)-3;i<=array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions);i++) choice_menu_taralpha[i]=1;
			}else{
				soul_tarx=432+15+5+15;
				soul_tary=520+16+36+24;
				choice_menu_tarx[battle_action_choice[battle_chara_now]]=32;
				choice_menu_tary=(battle_action_choice[battle_chara_now]-2)*36;
				for(var i=battle_action_choice-1;i<=battle_action_choice+2;i++) choice_menu_taralpha[i]=1;
			}
		}
	}else if(battle_button_state==BATTLE_BUTTON_STATE.item_use_choice){
		if(keyboard_check_pressed(global.keyup)){
			if(battle_action_choice[battle_chara_now]>1) battle_action_choice[battle_chara_now]--;
			//play sound
		}
		if(keyboard_check_pressed(global.keydown)){
			if(battle_action_choice[battle_chara_now]<global.charanum) battle_action_choice[battle_chara_now]++;
			//play sound
		}
		if(keyboard_check_pressed(global.keyx)){
			battle_button_state=BATTLE_BUTTON_STATE.item_menu;
		}
		if(keyboard_check_pressed(global.keyz)){
			item_using++;
//			script_execute(global.itemdata_scr[global.item[battle_item_choice[battle_chara_now]]],battle_action_choice[battle_chara_now]);
			if(battle_chara_now==global.charanum) {
				battle_state=BATTLE_STATES.encounter_text;
			}else{
				battle_chara_now++;
				battle_button_state=BATTLE_BUTTON_STATE.button_choice;
			}
		}
		//选角色
		
			for(var i=1;i<=3;i++){
				choice_menu_taralpha[i]=1;
				choice_menu_tary=0;
				choice_menu_tarx[i]=0;
			}
			switch(battle_action_choice[battle_chara_now]){
				case 1:
					soul_tarx=432+15+5+15;
					soul_tary=520+16+24;
					choice_menu_tarx[1]=32;
					break;
				case 2:
					soul_tarx=432+15+5+15;
					soul_tary=520+16+36+24;
					choice_menu_tarx[2]=32;
					break;
				case 3:
					soul_tarx=432+15+5+15;
					soul_tary=520+16+72+24;
					choice_menu_tarx[3]=32;
					break;
			}
	}else if(battle_button_state==BATTLE_BUTTON_STATE.mercy_menu){
		if(keyboard_check_pressed(global.keyup)){
			if(battle_action_choice[battle_chara_now]>1) battle_action_choice[battle_chara_now]--;
			//play sound
		}
		if(keyboard_check_pressed(global.keydown)){
			if(battle_action_choice[battle_chara_now]<array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions)) battle_action_choice[battle_chara_now]++;
			//play sound
		}
		if(keyboard_check_pressed(global.keyx)){
			battle_button_state=BATTLE_BUTTON_STATE.button_choice;
		}
	}
	else{//按钮menu
		//create left-buttom Chara info
		if(!instance_exists(obj_battle_charainfo)){//Create instance
			instance_create_layer(0,0,"Instances",obj_battle_charainfo);
			
		}
		switch(battle_button_state){
			case BATTLE_BUTTON_STATE.fight_menu:
				if(keyboard_check_pressed(global.keyup)){
					if(battle_menu_choice[battle_chara_now]>1) battle_menu_choice[battle_chara_now]--;
					//play sound
				}
				if(keyboard_check_pressed(global.keydown)){
					if(battle_menu_choice[battle_chara_now]<scr_enemy_num()) battle_menu_choice[battle_chara_now]++;
					//play sound
				}
				if(keyboard_check_pressed(global.keyx)){//return
					battle_button_state=BATTLE_BUTTON_STATE.button_choice;
					button_choice[battle_chara_now]=1;
				}
				if(keyboard_check_pressed(global.keyz)){
					fight_using++;
					if(battle_chara_now==global.charanum) {
						battle_state=BATTLE_STATES.encounter_text;
						battle_button_state=BATTLE_BUTTON_STATE.button_choice;
					}else{
						battle_chara_now++;
						battle_button_state=BATTLE_BUTTON_STATE.button_choice;
					}
					//play sound
				}
				choice_menu_tarx[1]=0;
				choice_menu_tarx[2]=0;
				choice_menu_tarx[3]=0;
				switch(battle_menu_choice[battle_chara_now]){
					case 1:
						soul_tarx=432+15+5+15;
						soul_tary=520+16+24;
						choice_menu_tarx[1]=32;
						break;
					case 2:
						soul_tarx=432+15+5+15;
						soul_tary=520+16+36+24;
						choice_menu_tarx[2]=32;
						break;
					case 3:
						soul_tarx=432+15+5+15;
						soul_tary=520+16+72+24;
						choice_menu_tarx[3]=32;
						break;
				}
				break;
			case BATTLE_BUTTON_STATE.act_menu:
				if(keyboard_check_pressed(global.keyup)){
					if(battle_menu_choice[battle_chara_now]>1) battle_menu_choice[battle_chara_now]--;
					//play sound
				}
				if(keyboard_check_pressed(global.keydown)){
					if(battle_menu_choice[battle_chara_now]<scr_enemy_num()) battle_menu_choice[battle_chara_now]++;
					//play sound
				}
				if(keyboard_check_pressed(global.keyx)){//return
					battle_button_state=BATTLE_BUTTON_STATE.button_choice;
					button_choice[battle_chara_now]=2;
				}
				if(keyboard_check_pressed(global.keyz)){
					//play sound
					battle_button_state=BATTLE_BUTTON_STATE.act_choice;//选操作
					battle_action_choice[battle_chara_now]=clamp(battle_action_choice[battle_chara_now],1,array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions));
				}
				choice_menu_tarx[1]=0;
				choice_menu_tarx[2]=0;
				choice_menu_tarx[3]=0;
				switch(battle_menu_choice[battle_chara_now]){
					case 1:
						soul_tarx=432+15+5+15;
						soul_tary=520+16+24;
						choice_menu_tarx[1]=32;
						break;
					case 2:
						soul_tarx=432+15+5+15;
						soul_tary=520+16+36+24;
						choice_menu_tarx[2]=32;
						break;
					case 3:
						soul_tarx=432+15+5+15;
						soul_tary=520+16+72+24;
						choice_menu_tarx[3]=32;
						break;
				}
				break;
			case BATTLE_BUTTON_STATE.item_menu:
				if(keyboard_check_pressed(global.keyup)){
					if(battle_item_choice[battle_chara_now]>1) battle_item_choice[battle_chara_now]--;
					//play sound
				}
				if(keyboard_check_pressed(global.keydown)){
					if(battle_item_choice[battle_chara_now]<global.item_num) battle_item_choice[battle_chara_now]++;
					//play sound
				}
				if(keyboard_check_pressed(global.keyx)){//return
					battle_button_state=BATTLE_BUTTON_STATE.button_choice;
					button_choice[battle_chara_now]=3;
				}
				if(keyboard_check_pressed(global.keyz)){
					//play sound
					battle_button_state=BATTLE_BUTTON_STATE.item_use_choice;//选角色
					battle_action_choice[battle_chara_now]=clamp(battle_action_choice[battle_chara_now],1,global.charanum);
				}
				
				for(var i=1;i<=global.item_num;i++){
					choice_menu_tarx[i]=0;
					choice_menu_taralpha[i]=0;
				}
				
				if(global.item_num<=3){//正常
					choice_menu_tary=0;
					for(var i=1;i<=3;i++) choice_menu_taralpha[i]=1;
					switch(battle_item_choice[battle_chara_now]){
						case 1:
							soul_tarx=432+15+5+15;
							soul_tary=520+16+24;
							choice_menu_tarx[1]=32;
							break;
						case 2:
							soul_tarx=432+15+5+15;
							soul_tary=520+16+36+24;
							choice_menu_tarx[2]=32;
							break;
						case 3:
							soul_tarx=432+15+5+15;
							soul_tary=520+16+72+24;
							choice_menu_tarx[3]=32;
							break;
					}
				}else if(global.item_num>3){
					if(battle_item_choice[battle_chara_now]==1){
						soul_tarx=432+15+5+15;
						soul_tary=520+16+24;
						choice_menu_tarx[1]=32;
						choice_menu_tary=0;
						for(var i=1;i<=4;i++) choice_menu_taralpha[i]=1;
					}else if(battle_item_choice[battle_chara_now]==global.item_num-1){
						soul_tarx=432+15+5+15;
						soul_tary=520+16+72+24;
						choice_menu_tarx[global.item_num-1]=32;
						choice_menu_tary=(battle_item_choice[battle_chara_now]-3)*36;
						for(var i=global.item_num-3;i<=global.item_num;i++) choice_menu_taralpha[i]=1;
					}else if(battle_item_choice[battle_chara_now]==global.item_num){
						soul_tarx=432+15+5+15;
						soul_tary=520+16+108+24;
						choice_menu_tarx[global.item_num]=32;
						choice_menu_tary=(battle_item_choice[battle_chara_now]-4)*36;
						for(var i=global.item_num-3;i<=global.item_num;i++) choice_menu_taralpha[i]=1;
					}else{
						soul_tarx=432+15+5+15;
						soul_tary=520+16+36+24;
						choice_menu_tarx[battle_item_choice[battle_chara_now]]=32;
						choice_menu_tary=(battle_item_choice[battle_chara_now]-2)*36;
						for(var i=battle_item_choice[battle_chara_now]-1;i<=battle_item_choice[battle_chara_now]+2;i++) choice_menu_taralpha[i]=1;
					}
				}
				break;
			case BATTLE_BUTTON_STATE.mercy_menu:
				if(keyboard_check_pressed(global.keyup)){
					if(battle_action_choice>1) battle_action_choice[battle_chara_now]--;
					//play sound
				}
				if(keyboard_check_pressed(global.keydown)){
					if(battle_action_choice<1) battle_action_choice[battle_chara_now]++;
					//play sound
				}
				if(keyboard_check_pressed(global.keyx)){//return
					battle_button_state=BATTLE_BUTTON_STATE.button_choice;
					button_choice[battle_chara_now]=4;
				}
				choice_menu_tarx[1]=0;
				choice_menu_tarx[2]=0;
				choice_menu_tarx[3]=0;
				switch(battle_action_choice[battle_chara_now]){
					case 1:
						soul_tarx=432+15+5+15;
						soul_tary=520+16+24;
						choice_menu_tarx[1]=32;
						break;
					case 2:
						soul_tarx=432+15+5+15;
						soul_tary=520+16+36+24;
						choice_menu_tarx[2]=32;
						break;
					case 3:
						soul_tarx=432+15+5+15;
						soul_tary=520+16+72+24;
						choice_menu_tarx[3]=32;
						break;
				}
				break;
		}
	}
	//角色箭头
	arrow_tarx=144;
	arrow_tary=init_chara_y[battle_chara_now]-character_inst[battle_chara_now].sprite_height/2;
}
if(battle_state==BATTLE_STATES.player){
	//创建打字机
	if(battle_button_state==BATTLE_BUTTON_STATE.button_choice){
		if(!instance_exists(battle_ui_dialog)){
			battle_ui_dialog=scr_create_text(432+15+5,520+16,"setting",battle_ui_dialog_text);
			scr_ui_dialog_setedge(1248,battle_ui_dialog);
		}
	}else{
		if(instance_exists(battle_ui_dialog)){
			instance_destroy(battle_ui_dialog);
		}
	}
}
if(battle_state==BATTLE_STATES.encounter_text){
	if(item_using){//ITEM
		for(var i=1;i<=global.charanum;i++){//遍历chara_pos
			if(button_choice[i]==3){//选择的是ITEM
				script_execute(global.itemdata_scr[global.item[battle_item_choice[i]]],battle_action_choice[i],battle_item_choice[i]);
				item_using--;
			}
		}
	}else if(act_using){//ACT
		for(var i=1;i<=global.charanum;i++){//遍历chara_pos
			if(button_choice[i]==2){//是ACT
				scr_enemy_get(battle_menu_choice[i]-1).action_index=battle_action_choice[i];
				with(scr_enemy_get(battle_menu_choice[i]-1)){
					event_user(1);
				}
				act_using--;
			}
		}
	}
	else{
		soul_tarx=-999;
		soul_tary=-999;
		arrow_tarx=-999;
		arrow_tary=-999;
		
		if(!instance_exists(battle_ui_dialog)){
			if(scr_ui_dialog_size()>0){
				battle_ui_dialog=scr_create_text(432+15+5,520+16,"setting",scr_ui_dialog_get()){
					battle_ui_dialog.can_destroy=1;
				}
				scr_ui_dialog_setedge(1248,battle_ui_dialog);
			}else{
				if(!global.fighting){
					scr_fadeout(global.target_rm,global.target_x,global.target_y);
				}else if(!fight_using){
					battle_state=BATTLE_STATES.enemy_dialog;
					with(scr_enemy_get(battle_menu_choice[battle_chara_now]-1)){
						event_user(0);
					}
				}
			}
		}
	}
	
	if(fight_using&&scr_ui_dialog_size()==0&&!instance_exists(obj_battle_text)&&!item_using&&!act_using&&global.fighting){//Fight
		if(!battle_target_resetable) battle_target_resetable=(battle_button_state>BATTLE_BUTTON_STATE.fight_damage||battle_button_state<BATTLE_BUTTON_STATE.fight_menu);
		if(battle_fight_nowpos<=0){
			battle_fight_nowpos=1;
			while(battle_fight_nowpos<=global.charanum){
				if(button_choice[battle_fight_nowpos]==1){
					break;
				}
				battle_fight_nowpos++;
			}
		}
		
		if(battle_target_resetable){
			if(battle_target_resettime) battle_target_resettime--;
			else{
				battle_target_resetable=0;
				battle_button_state=BATTLE_BUTTON_STATE.fight_target;//出蓄力条
				scr_target_choice_create(global.charabattletarget[battle_fight_nowpos]);//生成target_choice（那个竖条子）
				battle_chara_fighting_count=battle_chara_fighting_count_real;
				battle_chara_fighting=battle_fight_nowpos;
				battle_target_time=0;
			}
		}else if(battle_button_state==BATTLE_BUTTON_STATE.fight_target){//蓄力条
			script_execute(target_script[global.charabattletarget[battle_fight_nowpos]]);
		}else if(battle_button_state==BATTLE_BUTTON_STATE.fight_anim){
			if(battle_fight_anim_time){
				battle_fight_anim_time--;
			}else{
				for(var i=1;i<=scr_enemynum(global.next_enemy_id);i++){
					if(!instance_exists(battle_damage_inst[i])){
						battle_damage_inst[i]=instance_create_layer(1120,init_chara_y[battle_menu_choice[i]]-75,"anim",obj_damage_num);
						battle_damage_inst[i].pos=i;
					}
				}
				for(var i=1;i<=scr_enemynum(global.next_enemy_id);i++){
					if(battle_damage[i]>0){
						with(scr_enemy_get(battle_menu_choice[i]-1)){//attacked dialog
							event_user(2);//更改为受伤对话
							event_user(0);
							scr_battle_enemyhit(other.battle_damage[i]);//减少怪物血量
						}
					}
					if(battle_magicdamage[i]>0){
						with(scr_enemy_get(battle_menu_choice[i]-1)){//magic attacked dialog
							event_user(3);//更改为魔法受伤对话
							event_user(0);
							scr_battle_enemymagichit(other.battle_magicdamage[i]);//减少怪物魔法血量
						}
					}
				}
				battle_button_state=BATTLE_BUTTON_STATE.fight_damage;
				battle_damage_time=80;
			}
		}else if(battle_button_state==BATTLE_BUTTON_STATE.fight_damage){
			if(battle_damage_time>0){
				battle_damage_time--;
			}else{
				battle_button_state=BATTLE_BUTTON_STATE.button_choice;
				battle_state=BATTLE_STATES.enemy_dialog;
				
				for(var i=1;i<=scr_enemynum(global.next_enemy_id);i++) if(instance_exists(battle_damage_inst[i])) instance_destroy(battle_damage_inst[i]);
				if(instance_exists(battle_targetchoice_inst)) instance_destroy(battle_targetchoice_inst);
				if(instance_exists(battle_target_inst)) instance_destroy(battle_target_inst);
				for(var i=1;i<=global.charanum;i++){
					vis_fight[i]=0;//vis初始化
				}
				battle_chara_fighting_count=0;
				battle_chara_fighting_count_real=0;
				battle_fight_nowpos=-1;
			}
			
		}
		
	}
	
}
if(battle_state=BATTLE_STATES.enemy_dialog){
	if(!instance_exists(obj_enemy_battle_par)){//怪死光了
		battle_state=BATTLE_STATES.enemy;
		instance_create_layer(-999,-999,"Instances",obj_wave_ending);
	}else{//还有怪, 生成怪物对话气泡
		soul_tarx=character_inst[1].x;
		soul_tary=character_inst[1].y; 
		if(scr_enemy_dialog_size()>0){
			if(!instance_exists(obj_enemy_dialog)){
				instance_create_layer(880,96,"enemy",obj_enemy_dialog);
			}
		}else{//说完了 开打
			if(!instance_exists(obj_enemy_dialog)) battle_state=BATTLE_STATES.enemy;
		}
	}
}
if(battle_state==BATTLE_STATES.enemy){//怪物回合
	if(!instance_exists(obj_wave)){
		instance_create_layer(-999,-999,"Instances",wave_inst);
	}
	if(!instance_exists(obj_enemy_battle_par)){//怪死光了
		scr_battle_waveend();//结束怪物回合
		instance_create_layer(-999,-999,"Instances",obj_wave_ending);
	}
}

if(battle_state==BATTLE_STATES.player||battle_state==BATTLE_STATES.encounter_text){
	//set the target pos for the soul
	obj_battle_arrow.tarx=soul_tarx;
	obj_battle_arrow.tary=soul_tary;
	//set the target pos for the chara arrow
	obj_battle_arrow_chara.tarx=arrow_tarx;
	obj_battle_arrow_chara.tary=arrow_tary;
}

