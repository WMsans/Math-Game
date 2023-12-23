/// @description 

if(wave_time>=wave_max_time){
	//结束怪物回合
	scr_battle_waveend();
	obj_battle.wave_inst=nextwave;//下一回合instance
}else{
	wave_time++;
}