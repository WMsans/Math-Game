/// @description 

if(wave_time==2){
	var ball=instance_create_layer(800,330,"bullet",obj_bullet_ball);
	scr_anim_create(ball,"x",ANIM_TWEEN.SINE,0,800,200,20);
}

if(wave_time>=wave_max_time){
	//结束怪物回合
	scr_battle_waveend();
	obj_battle.wave_inst=obj_wave_ending;//下一回合instance
}else{
	wave_time++;
}