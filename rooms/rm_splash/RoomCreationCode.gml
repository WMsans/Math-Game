global.checkpoint_id=noone;
if(!file_exists("file0.sav")){
	global.checkpoint_rm=black_room;//black_room
	global.checkpoint_x=752;
	global.checkpoint_y=208;//508
	global.keyright=vk_right;
	global.keyleft=vk_left;
	global.keyup=vk_up;
	global.keydown=vk_down;
	global.keyesc=vk_escape;
	global.keyspace=vk_space;
	global.keyshift=vk_shift;
	global.keyctrl=vk_control;
	global.keyz=ord("Z");
	global.keyx=ord("X");
	global.keyc=ord("C");
	global.keya=ord("A");
	global.item_num=0;
	global.item[8]=0;
	
	global.charanum=1;
	global.charanowskill=1;
	global.charanowleader=1;
	for(var i=1;i<=12;i++){
		global.charaname[i]="Alex";
		global.charamaxhp[i]=100;
		global.charaweapon[i]=7;
		global.charaarmor[i]=4;
		global.charaspr[i]=1;
		global.charaattackanim[i]=obj_attack_anim_cut1;
		global.charaskill[i][1]=1;
		global.charaskillnum[i]=0;
		global.charabattletarget[i]=1;
		global.charaattack[i]=0;
		global.charamagicattack[i]=0;
		global.chararesistance[i]=0;
	}
	global.gold=0;
	
	global.backpacksize=8;
	global.mutiplayer=false;
	global.plot=1;
	
}else{
	scr_loadgame();
}
scr_anim_init();

global.target_x=global.checkpoint_x;
global.target_y=global.checkpoint_y;
global.charainst[1]=noone;

global.talking=0;
global.expecting_textblock_x=-999;
global.expecting_textblock_y=-999;

global.detecting_input=false;//for remapping

global.setting=false;
global.skill_setting=false;

global.fighting=false;
global.next_enemy_id=0;
global.trigger_enemy=noone;
global.trigger_enemy_list=ds_list_create();

for(var i=0;i<=global.charanum;i++) global.charahp[i]=global.charamaxhp[i];

scr_itemdata_load();
scr_load_setting();

//DEBUG
global.debug=true;
/*
scr_chara_join_team("Natasha",120,5,4,2,obj_attack_anim_cut1);

scr_item_add(6);
scr_item_add(1);
scr_item_add(1);
scr_item_add(1);
global.charahp[1]=50;
scr_skill_add(1,1);
//global.charabattletarget[1]=2;
//global.charabattletarget[2]=2;
*/
room_goto(rm_title);