 /// @description 
event_inherited();
//生成数字, 一共5个, 后4个重复
numbers[0]=0;
numbers[1]=1;
var highest=min(global.charamagicattack[obj_battle.battle_chara_fighting],scr_enemy_get(obj_battle.battle_menu_choice[obj_battle.battle_fight_nowpos]-1).magic_hp);
numbers[2]=(highest==global.charamagicattack[obj_battle.battle_chara_fighting] ? highest/4 : global.charamagicattack[obj_battle.battle_chara_fighting]);
numbers[3]=highest/3;
numbers[4]=highest/2;
numbers[5]=highest;
for(var i=6;i<=9;i++) numbers[i]=numbers[10-i];
