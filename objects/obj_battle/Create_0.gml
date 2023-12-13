#region enum init
enum BATTLE_STATES{
	enemy,
	player,
	enemy_dialog,
	dialog,
	
	encounter_text,
}
enum BATTLE_BUTTON_STATE{
	button_choice,//选择操作(FIGHT/ACT/ITEM/DEFENCE
	fight_menu,//挑一个怪来打
	fight_target,//蓄力条
	fight_anim,//武器动画
	fight_damage,//伤害动画
	
	act_menu,//挑一个怪
	act_choice,//挑一个行为
	
	item_menu,//选一个物品
	item_use_choice,//谁用这个物品
	
	mercy_menu,//没有用XD
}
#endregion

#region generate characters
scr_battle_init_charay();
character_inst[0]=noone;
for(var i=1;i<=global.charanum;i++){//generate characters
	character_inst[i]=instance_create_layer(144,init_chara_y[i],"player",obj_character_battle);
	with(character_inst[i]){
		pos=i;
	}
}
#endregion

#region target script init
target_script[1]=scr_target_physics;
target_script[2]=scr_target_naturalnumber;
#endregion

scr_enemy_dialog_init();

for(var i=1;i<=global.charanum;i++){
	button_choice[i]=1;//选择的按钮
	vis_fight[i]=0;
}
battle_fight_nowpos=-1;
battle_state=BATTLE_STATES.player;
battle_button_state=BATTLE_BUTTON_STATE.button_choice;

soul_tarx=-999;
soul_tary=-999;
arrow_tarx=-999;
arrow_tary=-999;

battle_ui_dialog=noone;
battle_ui_dialog_text="* Hello world!";

enemy_list=ds_list_create();
//menu事件
for(var i=1;i<=global.charanum;i++) battle_menu_choice[i]=1;//选择的怪物
for(var i=1;i<=global.charanum;i++) battle_action_choice[i]=1;//选择的ACT
for(var i=1;i<=global.charanum;i++) battle_item_choice[i]=1;//选择的物品

choice_menu_tary=0;
choice_menu_nowy=0;
for(var i=0;i<=12;i++){
	choice_menu_tarx[i]=0;
	choice_menu_nowx[i]=0;
	choice_menu_taralpha[i]=0;
	choice_menu_nowalpha[i]=0;
}
//fight_target
battle_target_inst=noone;
battle_targetchoice_inst=noone;
battle_target_time=0;
battle_target_maxtime=400;
battle_target_resetable=0;
battle_target_resettime=0;
battle_target_resettimer=60;

battle_fight_anim=noone;
battle_fight_anim_time=0;

for(var i=1;i<=scr_enemynum(global.next_enemy_id);i++){
	battle_damage_inst[i]=noone;
	battle_damage[i]=0;
	battle_magicdamage[i]=0;
}
battle_damage_time=0;

battle_chara_fighting=1;
battle_chara_fighting_count=0;
battle_chara_fighting_count_real=0;
battle_chara_now=1;

wave_inst=noone;

scr_battle_wave_setup(scr_battle_wave_setup_inst(global.next_enemy_id));

item_using=0;
act_using=0;
fight_using=0;
mercy_using=0;

booty_coin=0;
booty_EXP=0;