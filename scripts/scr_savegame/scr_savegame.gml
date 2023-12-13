function scr_savegame(){
	if(file_exists("file0.sav")){
		file_delete("file0.sav");
	}
	ini_open("file0.sav");
	ini_write_real("progress","room",global.checkpoint_rm);
	ini_write_real("progress","x",global.checkpoint_x);
	ini_write_real("progress","y",global.checkpoint_y);
	
	ini_write_real("remapping","right",global.keyright);
	ini_write_real("remapping","left",global.keyleft);
	ini_write_real("remapping","up",global.keyup);
	ini_write_real("remapping","down",global.keydown);
	ini_write_real("remapping","c",global.keyc);
	ini_write_real("remapping","esc",global.keyesc);
	ini_write_real("remapping","space",global.keyspace);
	ini_write_real("remapping","x",global.keyx);
	ini_write_real("remapping","z",global.keyz);
	ini_write_real("remapping","a",global.keya);
	ini_write_real("remapping","shift",global.keyshift);
	ini_write_real("remapping","ctrl",global.keyctrl);
	
	ini_write_real("item","num",global.item_num);
	ini_write_real("item","item1",global.item[1]);
	ini_write_real("item","item2",global.item[2]);
	ini_write_real("item","item3",global.item[3]);
	ini_write_real("item","item4",global.item[4]);
	ini_write_real("item","item5",global.item[5]);
	ini_write_real("item","item6",global.item[6]);
	ini_write_real("item","item7",global.item[7]);
	ini_write_real("item","item8",global.item[8]);
	
	ini_write_real("progress","charanum",global.charanum);
	ini_write_real("progress","charanowskill",global.charanowskill);
	ini_write_real("progress","charanowleader",global.charanowleader);
	for(var i=1;i<=global.charanum;i++){
		ini_write_real("progress","charaskillnum"+string(i),global.charaskillnum[i]);
		ini_write_string("progress","charaname"+string(i),global.charaname[i]);
		ini_write_real("progress","charaweapon"+string(i),global.charaweapon[i]);
		ini_write_real("progress","charaarmor"+string(i),global.charaarmor[i]);
		ini_write_real("progress","charaspr"+string(i),global.charaspr[i]);
		for(var j=1;j<=global.charaskillnum[i];j++) ini_write_real("progress","charaskill"+string(i)+"+"+string(j),global.charaskill[i][j]);
		ini_write_real("progress","charamaxhp"+string(i),global.charamaxhp[i]);
		ini_write_real("progress","charaattackanim"+string(i),global.charaattackanim[i]);
		ini_write_real("progress","charabattletarget"+string(i),global.charabattletarget[i]);
		ini_write_real("progress","chararesistance"+string(i),global.chararesistance[i]);
		ini_write_real("progress","charaattack"+string(i),global.charaattack[i]);
		ini_write_real("progress","charamagicattack"+string(i),global.charamagicattack[i]);
	}
	
	ini_write_real("progress","gold",global.gold);
	ini_write_real("progress","backpacksize",global.backpacksize);
	ini_write_real("progress","mutiplayer",global.mutiplayer);
	ini_write_real("progress","plot",global.plot);
	ini_close();
	
}