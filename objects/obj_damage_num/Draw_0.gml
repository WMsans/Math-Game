/// @description 
if(obj_battle.battle_damage_cnt[pos]==0&&obj_battle.battle_magicdamage[pos]==0) draw_self();
else {
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(fnt_battle_damage);
	if(obj_battle.battle_magicdamage[pos]){
		draw_set_color(c_yellow);
		draw_text(x,y,string(obj_battle.battle_magicdamage[pos]));
	}else{
		draw_set_color(c_white);
		draw_text(x,y,string(obj_battle.battle_damage[pos]));
	}
}