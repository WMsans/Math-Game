function scr_resetgame(){
	global.checkpoint_rm=black_room;
	global.checkpoint_x=752;
	global.checkpoint_y=208;
	
	global.keyright=vk_right;
	global.keyleft=vk_left;
	global.keyup=vk_up;
	global.keydown=vk_down;
	global.keyc=ord("C");
	global.keyesc=vk_escape;
	global.keyspace=vk_space;
	global.keyx=ord("X");
	global.keyz=ord("Z");
	global.keya=ord("A");
	global.keyshift=vk_shift;
	global.keyctrl=vk_control;
	
	global.item_num=0;
	global.item[1]=0;
	global.item[2]=0;
	global.item[3]=0;
	global.item[4]=0;
	global.item[5]=0;
	global.item[6]=0;
	global.item[7]=0;
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
		global.charaskill[i][1]=1;
		global.charaskillnum[i]=0;
		global.charabattletarget[i]=1;
		global.charaattack[i]=0;
		global.charamagicattack[i]=0;
		global.chararesistance[i]=0;
	}
	global.charaskillnum[1]=0;
	global.gold=0;
	
	global.backpacksize=8;
	global.mutiplayer=false;
	global.plot=1;
	
	global.candytook = 0;
}