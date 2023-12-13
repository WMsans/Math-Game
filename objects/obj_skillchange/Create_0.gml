/// @description 
global.skill_setting=1;

_charanowskill=global.charanowskill;
_charanowleader=global.charanowleader;

box_x=camera_get_view_x(view_camera[0]);
box_y=camera_get_view_y(view_camera[0]);
arrow_tarx=-999;
arrow_tary=-999;
arrow_pos=_charanowskill;
border=32;
yborder_negative_tar=0;
yborder_negative=0;
yborder_negative2_tar=0;
yborder_negative2=0;


skill_posx[1]=0;
skill_tarposx[1]=0;
skill_alpha[1]=0;
skill_taralpha[1]=0;
chara_posx[1]=0;
chara_tarposx[1]=0;
chara_alpha[1]=0;
chara_taralpha[1]=0;

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
for(var i=1;i<=global.charanum;i++){
	chara_posx[i]=672+box_x+border;
	chara_tarposx[i]=672+box_x+border;
	chara_alpha[i]=0;
	if(_charanowleader<=5){
		if(i<=6) chara_taralpha[i]=1;
		else chara_taralpha[i]=0;
	}else if(_charanowleader==global.charanum){
		if(_charanowleader-i<=5) chara_taralpha[i]=1;
		else chara_taralpha[i]=0;
	}else{
		if(_charanowleader-i<=4&&i<_charanowleader) chara_taralpha[i]=1;
		else if(i-_charanowleader<=1&&i>_charanowleader) chara_taralpha[i]=1;
		else chara_taralpha[i]=0;
	}
}

if(!instance_exists(obj_skillchange_arrow)){
	instance_create_layer(-999,-999,"itembox_arrow",obj_skillchange_arrow);
}

if(global.charaskillnum[global.charanowleader]) arrow_state=1;
else{
	arrow_state=2;
	arrow_pos=global.charanowleader;
}