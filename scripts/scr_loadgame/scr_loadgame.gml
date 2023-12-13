function scr_loadgame(){
	if(file_exists("file0.sav")){
		ini_open("file0.sav");
		global.checkpoint_rm=ini_read_real("progress","room",rm_01);
		global.checkpoint_x=ini_read_real("progress","x",688);
		global.checkpoint_y=ini_read_real("progress","y",384);
		
		global.keyright=ini_read_real("remapping","right",vk_right);
		global.keyleft=ini_read_real("remapping","left",vk_left);
		global.keyup=ini_read_real("remapping","up",vk_up);
		global.keydown=ini_read_real("remapping","down",vk_down);
		global.keyc=ini_read_real("remapping","c",ord("C"));
		global.keyesc=ini_read_real("remapping","esc",vk_escape);
		global.keyspace=ini_read_real("remapping","space",vk_space);
		global.keyx=ini_read_real("remapping","x",ord("X"));
		global.keyz=ini_read_real("remapping","z",ord("Z"));
		global.keya=ini_read_real("remapping","a",ord("A"));
		global.keyshift=ini_read_real("remapping","shift",vk_shift);
		global.keyctrl=ini_read_real("remapping","ctrl",vk_control);
		
		global.item_num=ini_read_real("item","num",0);
		global.item[1]=ini_read_real("item","item1",0);
		global.item[2]=ini_read_real("item","item2",0);
		global.item[3]=ini_read_real("item","item3",0);
		global.item[4]=ini_read_real("item","item4",0);
		global.item[5]=ini_read_real("item","item5",0);
		global.item[6]=ini_read_real("item","item6",0);
		global.item[7]=ini_read_real("item","item7",0);
		global.item[8]=ini_read_real("item","item8",0);
		
		global.charanum=ini_read_real("progress","charanum",1);
		global.charanowskill=ini_read_real("progress","charanowskill",1);
		global.charanowleader=ini_read_real("progress","charanowleader",1);
		for(var i=1;i<=global.charanum;i++){
			global.charaskillnum[i]=ini_read_real("progress","charaskillnum"+string(i),1);
			global.charaname[i]=ini_read_string("progress","charaname"+string(i),"Alex");
			global.charaweapon[i]=ini_read_real("progress","charaweapon"+string(i),3);
			global.charaarmor[i]=ini_read_real("progress","charaarmor"+string(i),4);
			global.charaspr[i]=ini_read_real("progress","charaspr"+string(i),1);
			for(var j=1;j<=global.charaskillnum[i];j++) global.charaskill[i][j]=ini_read_real("progress","charaskill"+string(i)+"+"+string(j),1);
			global.charamaxhp[i]=ini_read_real("progress","charamaxhp"+string(i),100);
			global.charaattackanim[i]=ini_read_real("progress","charaattackanim"+string(i),obj_attack_anim_cut1);
			global.charabattletarget[i]=ini_read_real("progress","charabattletarget"+string(i),1);
			global.charaattack[i]=ini_read_real("progress","charaattack"+string(i),0);
			global.charamagicattack[i]=ini_read_real("progress","charamagicattack"+string(i),0);
			global.chararesistance[i]=ini_read_real("progress","chararesistance"+string(i),0);;
		}
		
		global.gold=ini_read_real("progress","gold",0);
		global.backpacksize=ini_read_real("progress","backpacksize",8);
		global.mutiplayer=ini_read_real("progress","mutiplayer",false);
		global.plot=ini_read_real("progress","plot",1);
		ini_close();
		//scr_fadeout(global.checkpoint_rm,global.checkpoint_x,global.checkpoint_y);
	}
}