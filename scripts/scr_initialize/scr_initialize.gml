function scr_initialize(){
randomize();
scr_enums();
global.checkpoint_id=noone;
if(!file_exists("file0.sav")){
	scr_resetgame();
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

#region DEBUG
//scr_chara_join_team("Natasha", 100, 7, 4, 2);
global.debug=true;
global.plot = plots.get_sword;
global.checkpoint_rm=into_forest2;
global.target_x=352;
global.target_y=208;
scr_item_add(3);

#endregion
room_goto(rm_title);
}