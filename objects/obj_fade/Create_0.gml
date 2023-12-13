fadeout=0;
a=1;
target_room=noone;
fadeoutrate=0.02;
fadeinrate=0.05;
w=display_get_gui_width();
h=display_get_gui_height();
if(global.fighting){
	battle_tarx[1]=144;
	battle_tary[1]=144;
	battle_tarx[2]=144;
	battle_tary[2]=300;
	
	battle_enemy_tarx[1]=1120;
	battle_enemy_tary[1]=144;
	

	for(var i=1;i<=global.charanum;i++){
		battle_nowx[i]=obj_player.follower_x[32*(i-1)]-obj_camera.x+w/2;//
		battle_nowy[i]=obj_player.follower_y[32*(i-1)]-obj_camera.y+h/2;//
	}
	for(var i=1;i<=scr_enemynum(global.next_enemy_id);i++){
		battle_enemy_nowx[i]=global.trigger_enemy.x-obj_camera.x+w/2;
		battle_enemy_nowy[i]=global.trigger_enemy.y-obj_camera.y+h/2;
	}
}