/// @description Key check
if(global.setting) exit;
box_x=camera_get_view_x(view_camera[0]);
box_y=camera_get_view_y(view_camera[0]);
x=box_x+160;
y=box_y+192;

if(arrow_state==1){
	//choose skill
	if(keyboard_check_pressed(global.keydown)){
		arrow_pos=clamp(arrow_pos+1,1,global.charaskillnum[_charanowleader]);
		if(arrow_pos!=global.charaskillnum[_charanowleader]) yborder_negative_tar=max(0,(arrow_pos-5)*string_height(scr_skill_name(global.charaskill[_charanowleader][arrow_pos])));//set yborder_negative_tar
	}
	if(keyboard_check_pressed(global.keyup)){
		arrow_pos=clamp(arrow_pos-1,1,global.charaskillnum[_charanowleader]);
		yborder_negative_tar=max(0,(arrow_pos-5)*string_height(scr_skill_name(global.charaskill[_charanowleader][arrow_pos])));//set yborder_negative_tar
	}
	_charanowskill=arrow_pos;
	if(keyboard_check_pressed(global.keyright)){
		arrow_state=2;
		arrow_pos=clamp(_charanowleader,1,global.charanum);
		//set yborder_negative_tar
		if(arrow_pos!=global.charanum) yborder_negative2_tar=max(0,(arrow_pos-5)*string_height(global.charaname[arrow_pos]));
		else yborder_negative2_tar=max(0,(arrow_pos-4)*string_height(global.charaname[arrow_pos]));
	}
}else if(arrow_state==2){
	//choose characters
	if(keyboard_check_pressed(global.keydown)){
		arrow_pos=clamp(arrow_pos+1,1,global.charanum);
		if(arrow_pos!=global.charanum) yborder_negative2_tar=max(0,(arrow_pos-5)*string_height(global.charaname[arrow_pos]));//set yborder_negative_tar
		
	}
	if(keyboard_check_pressed(global.keyup)){
		arrow_pos=clamp(arrow_pos-1,1,global.charanum);
		yborder_negative2_tar=max(0,(arrow_pos-5)*string_height(global.charaname[arrow_pos]));//set yborder_negative_tar
	}
	if(_charanowleader!=arrow_pos){//角色切换了
		_charanowleader=arrow_pos;
		for(var i=1;i<=global.charaskillnum[_charanowleader];i++){
			skill_posx[i]=160+box_x+border;
			skill_tarposx[i]=160+box_x+border;
			skill_alpha[i]=0;
			
			if(_charanowskill<=5){
				if(i<=6) skill_taralpha[i]=1;
				else skill_taralpha[i]=0;
			}else if(_charanowskill==global.charaskillnum[_charanowleader]){
				if(_charanowskill-i<=5) skill_taralpha[i]=1;
				else skill_taralpha[i]=0;
			}else{
				if(_charanowskill-i<=4&&i<_charanowskill) skill_taralpha[i]=1;
				else if(i-_charanowskill<=1&&i>_charanowskill) skill_taralpha[i]=1;
				else skill_taralpha[i]=0;
			}
		}
		//set yborder_negative_tar
		if(global.charaskillnum[_charanowleader]>0){
			var tmp_charanowskill=clamp(_charanowskill,1,global.charaskillnum[_charanowleader]);
			if(tmp_charanowskill!=global.charaskillnum[_charanowleader]) yborder_negative_tar=max(0,(tmp_charanowskill-5)*string_height(scr_skill_name(global.charaskill[_charanowleader][tmp_charanowskill])));
			else yborder_negative_tar=max(0,(tmp_charanowskill-4)*string_height(scr_skill_name(global.charaskill[_charanowleader][tmp_charanowskill])));
		}
	}
	
	if(keyboard_check_pressed(global.keyleft)&&global.charaskillnum[_charanowleader]){
		arrow_state=1;
		arrow_pos=clamp(_charanowskill,1,global.charaskillnum[_charanowleader]);
		//set yborder_negative_tar
		if(arrow_pos!=global.charaskillnum[_charanowleader]) yborder_negative_tar=max(0,(arrow_pos-5)*string_height(scr_skill_name(global.charaskill[_charanowleader][arrow_pos])));
		else yborder_negative_tar=max(0,(arrow_pos-4)*string_height(scr_skill_name(global.charaskill[_charanowleader][arrow_pos])));
	}
}
