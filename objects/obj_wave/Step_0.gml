/// @description 

if(wave_time==10){
	var ball=instance_create_layer(800,330,"bullet",obj_bullet_ball);
	scr_anim_create(ball,"x",0,0,800,200,100);
}

if(wave_time>=wave_max_time){
	//结束怪物回合
	scr_battle_waveend();
	obj_battle.wave_inst=obj_wave1;//下一回合instance
}else{
	wave_time++;
}