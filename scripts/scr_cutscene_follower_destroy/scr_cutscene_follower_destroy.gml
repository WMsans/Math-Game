///@arg pos
function scr_cutscene_follower_destroy(){
	var _pos=argument0;
	if(instance_exists(global.charainst[_pos])) instance_destroy(global.charainst[_pos]);
	if(_pos==global.charanum){
		
	}else{
		
		for(var i=_pos;i<global.charanum;i++){
			global.charahp[i]=global.charahp[i+1];
			global.charamaxhp[i]=global.charamaxhp[i+1];
			global.charaname[i]=global.charaname[i+1];
			global.charaweapon[i]=global.charaweapon[i+1];
			global.charaarmor[i]=global.charaarmor[i+1];
			global.charaspr[i]=global.charaspr[i+1];
			global.charainst[i]=global.charainst[i+1];
		}
	}
	global.charanum--;
	scr_cutscene_end_action();
}