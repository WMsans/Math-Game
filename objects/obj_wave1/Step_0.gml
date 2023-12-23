/// @description 
event_inherited();
if(wave_time==2){
	var ball=instance_create_layer(800,330,"bullet",obj_bullet_ball);
	scr_anim_create(ball,"x",ANIM_TWEEN.SINE,0,800,200,20);
}
