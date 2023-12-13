draw_set_color(c_black);
draw_set_alpha(a);
draw_rectangle(0,0,w,h,0);
draw_set_alpha(1);

if(global.fighting){
	for(var i=1;i<=global.charanum;i++){
		draw_sprite(scr_battlespr_intro(i),a/fadeoutrate/5,battle_nowx[i],battle_nowy[i]);
		battle_nowx[i]+=(battle_tarx[i]-battle_nowx[i])*0.143;
		battle_nowy[i]+=(battle_tary[i]-battle_nowy[i])*0.143;
	}
	var next_enm_num=scr_enemynum(global.next_enemy_id);
	for(var i=1;i<=next_enm_num;i++){
		draw_sprite(scr_battleenemyspr(global.next_enemy_id,i),a/fadeoutrate/5,battle_enemy_nowx[i],battle_enemy_nowy[i]);
		battle_enemy_nowx[i]+=(battle_enemy_tarx[i]-battle_enemy_nowx[i])*0.143;
		battle_enemy_nowy[i]+=(battle_enemy_tary[i]-battle_enemy_nowy[i])*0.143;
	}
	
}