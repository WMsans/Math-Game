/// @description Draw Options In Chatbox
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_font(fnt_init);

if(battle_state==BATTLE_STATES.player){
	if(battle_button_state==BATTLE_BUTTON_STATE.fight_menu||battle_button_state==BATTLE_BUTTON_STATE.act_menu){
		draw_text(432+15+5+choice_menu_nowx[1],520+16,string(scr_enemy_get(0).name));//绘制敌人名
		if(scr_enemy_num()>1){//绘制第2个敌人名
			draw_text(432+15+5+choice_menu_nowx[2],520+16+36,string(scr_enemy_get(1).name));
			if(scr_enemy_num()>2){//绘制第3个敌人名
				draw_text(432+15+5+choice_menu_nowx[3],520+16+72,string(scr_enemy_get(2).name));
				
			}
		}
		for(var i=1;i<=scr_enemy_num();i++){//画敌人血条
			draw_set_color(c_red);
			draw_set_font(fnt_init);
			var text_len=string_width(scr_enemy_get(i-1).name);
			draw_rectangle(432+15+5+text_len+choice_menu_nowx[i]+50,520+20,432+15+5+text_len+choice_menu_nowx[i]+50+100,520+20+30,false);
			draw_set_color(c_lime);
			draw_rectangle(432+15+5+text_len+choice_menu_nowx[i]+50,520+20,432+15+5+text_len+choice_menu_nowx[i]+50+(scr_enemy_get(i-1).hp/scr_enemy_get(i-1).maxhp)*100,520+20+30,false);
		}
	}
	if(battle_button_state==BATTLE_BUTTON_STATE.act_choice){
		draw_set_font(fnt_init);
		draw_set_color(c_white);
		for(var i=1;i<=array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions);i++){
			draw_text_color(432+15+5+choice_menu_nowx[i],520+16+36*(i-1)-choice_menu_nowy,string(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions[i-1]),c_white,c_white,c_white,c_white,choice_menu_nowalpha[i]);
		}
	}else if(battle_button_state==BATTLE_BUTTON_STATE.item_menu){
		draw_set_font(fnt_init);
		draw_set_color(c_white);
		for(var i=1;i<=global.item_num;i++){
			draw_text_color(432+15+5+choice_menu_nowx[i],520+16+36*(i-1)-choice_menu_nowy,global.itemdata_name[global.item[i]],c_white,c_white,c_white,c_white,choice_menu_nowalpha[i]);
		}
	}else if(battle_button_state==BATTLE_BUTTON_STATE.item_use_choice){
		draw_set_font(fnt_init);
		draw_set_color(c_white);
		for(var i=1;i<=global.charanum;i++){
			draw_text(432+15+5+choice_menu_nowx[i],520+16+36*(i-1),global.charaname[i]);
		}
	}else if(battle_button_state==BATTLE_BUTTON_STATE.mercy_menu){
		draw_set_font(fnt_init);
		draw_set_color(c_white);
		for(var i=1;i<=global.charanum;i++){
			draw_text(432+15+5+choice_menu_nowx[i],520+16+36*(i-1),"escape");
		}
	}
	//animate
	if(battle_button_state==BATTLE_BUTTON_STATE.act_choice){
		for(var i=1;i<=array_length(scr_enemy_get(battle_menu_choice[battle_chara_now]-1).actions);i++){
			choice_menu_nowx[i]+=(choice_menu_tarx[i]-choice_menu_nowx[i])/5;
			choice_menu_nowalpha[i]+=(choice_menu_taralpha[i]-choice_menu_nowalpha[i])/5;
		}
		choice_menu_nowy+=(choice_menu_tary-choice_menu_nowy)/5;
	}else if(battle_button_state==BATTLE_BUTTON_STATE.item_menu){
		for(var i=1;i<=global.item_num;i++){
			choice_menu_nowx[i]+=(choice_menu_tarx[i]-choice_menu_nowx[i])/5;
			choice_menu_nowalpha[i]+=(choice_menu_taralpha[i]-choice_menu_nowalpha[i])/5;
		}
		choice_menu_nowy+=(choice_menu_tary-choice_menu_nowy)/5;
	}else if(battle_button_state==BATTLE_BUTTON_STATE.item_use_choice){
		for(var i=1;i<=global.charanum;i++){
			choice_menu_nowx[i]+=(choice_menu_tarx[i]-choice_menu_nowx[i])/5;
		}
	}
	else{
		for(var i=1;i<=scr_enemy_num();i++){
			choice_menu_nowx[i]+=(choice_menu_tarx[i]-choice_menu_nowx[i])/5;
		}
	}
}else{
	for(var i=1;i<=scr_enemy_num();i++){//animate
		choice_menu_nowx[i]+=(choice_menu_tarx[i]-choice_menu_nowx[i])/5;
	}
}

