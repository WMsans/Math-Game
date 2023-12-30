/// @description 
event_inherited();
if(wave_time==2){
	var ball=instance_create_layer(800,330,"bullet",obj_bullet_ball);
	scr_anim_create(ball,"x",ANIM_TWEEN.SINE,0,800,200,20);
}
if(wave_time == 1){
	var i = 0
	timer2 = 0
	repeat 52
	{
		var bone = Stick(80,0+(i*30)+5,180,-90,2,0,0,0,0,1)
		scr_anim_create(bone,"x",2,0,80,90,5,20+60+60)
		scr_anim_create(bone,"x",2,0,80+90,120,5,60+60+60)
		scr_anim_create(bone,"x",2,0,80+90+120,160,5,80+60+60)
		scr_anim_create(bone,"x",2,0,80+90+140+160,-160-120-120,30,80+60+60+30)
		i ++
	}
	i = 0
}

if wave_time >= 20 && wave_time <= 340
{
	timer2 ++
	if wave_time % 15 == 0
	{
		Stick(1280,528,65-20+sin((timer2)*0.5)*30,0,1,-9,0,0,0,1)
		Stick(0,0,65-20+sin((timer2)*0.5)*30,180,1,9,0,0,0,1)
	}
}
