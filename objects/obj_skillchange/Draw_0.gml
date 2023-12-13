/// @description 
if(global.setting) exit;
draw_set_font(fnt_init);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_sprite(spr_skill_mainbox,0,x,y);

var _yborder=42-yborder_negative;
yborder_negative+=(yborder_negative_tar-yborder_negative)/5;
//draw options
var nowarrow_pos=_charanowskill;
if(arrow_state==1) nowarrow_pos=arrow_pos;

for(var i=1;i<=global.charaskillnum[_charanowleader];i++){
	if(nowarrow_pos==i){
		if(arrow_state==1){//locate the arrow x,y
			arrow_tarx=x+36;
			arrow_tary=y+_yborder;
			
			skill_tarposx[i]=64+x+border;
		}else skill_tarposx[i]=x+border;
		skill_taralpha[i]=1;
	}
	else{
		skill_tarposx[i]=x+border;
		if(nowarrow_pos<=5){
			if(i<=6) skill_taralpha[i]=1;
			else skill_taralpha[i]=0;
		}else if(nowarrow_pos==global.charaskillnum[_charanowleader]){
			if(nowarrow_pos-i<=5) skill_taralpha[i]=1;
			else skill_taralpha[i]=0;
		}else{
			if(nowarrow_pos-i<=4&&i<nowarrow_pos) skill_taralpha[i]=1;
			else if(i-nowarrow_pos<=1&&i>nowarrow_pos) skill_taralpha[i]=1;
			else skill_taralpha[i]=0;
		}
		
	}
	if(i==_charanowskill) draw_set_color(c_yellow);
	draw_text_color(skill_posx[i],y+_yborder,scr_skill_name(global.charaskill[_charanowleader][i]),draw_get_color(),draw_get_color(),c_white,c_white,skill_alpha[i]);
	_yborder+=string_height(scr_skill_name(global.charaskill[_charanowleader][i]));
	draw_set_color(c_white);
}
//animate the movement of skill text
for(var i=1;i<=global.charaskillnum[_charanowleader];i++){
	skill_posx[i]+=(skill_tarposx[i]-skill_posx[i])/5;
	skill_alpha[i]+=(skill_taralpha[i]-skill_alpha[i])/5;
}

var x2=box_x+672;
var y2=box_y+192;
_yborder=42-yborder_negative2;
yborder_negative2=(yborder_negative2_tar-yborder_negative2)/5;
draw_sprite(spr_skill_mainbox,0,x2,y2);
//draw characters
nowarrow_pos=_charanowleader;
if(arrow_state==2) nowarrow_pos=arrow_pos;

for(var i=1;i<=global.charanum;i++){
	if(nowarrow_pos==i&&arrow_state==2){
		//locate the arrow x,y
		arrow_tarx=x2+36;
		arrow_tary=y2+_yborder;
		
		chara_tarposx[i]=64+x2+border;
		chara_taralpha[i]=1;
	}else{
		chara_tarposx[i]=x2+border;
		if(arrow_state==2){
			if(nowarrow_pos<=5){
				if(i<=6) chara_taralpha[i]=1;
				else chara_taralpha[i]=0;
			}else if(nowarrow_pos==global.charanum){
				if(nowarrow_pos-i<=5) chara_taralpha[i]=1;
				else chara_taralpha[i]=0;
			}else{
				if(nowarrow_pos-i<=4&&i<nowarrow_pos) chara_taralpha[i]=1;
				else if(i-nowarrow_pos<=1&&i>nowarrow_pos) chara_taralpha[i]=1;
				else chara_taralpha[i]=0;
			}
		}
	}
	chara_alpha[i]+=(chara_taralpha[i]-chara_alpha[i])/5;
	if(i==_charanowleader) draw_set_color(c_yellow);
	draw_text_color(chara_posx[i],y2+_yborder,global.charaname[i],draw_get_color(),draw_get_color(),c_white,c_white,chara_alpha[i]);
	_yborder+=string_height(global.charaname[i]);
	draw_set_color(c_white);
}
//animate the movement of chara text
for(var i=1;i<=global.charanum;i++){
	chara_posx[i]+=(chara_tarposx[i]-chara_posx[i])/5;
}
