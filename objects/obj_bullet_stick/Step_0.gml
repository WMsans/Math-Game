/// @description 
timer ++
event_user(type+2)
_body.image_alpha = image_alpha
_top.image_alpha = image_alpha
_bottom.image_alpha = image_alpha
if(destroy_time == -infinity)
{
	if((x<-100-length/2)or(x>1380+length/2)or(y<-100-length/2)or(y>820+length/2))
	{

		instance_destroy()
		instance_destroy(_body)
		instance_destroy(_bottom)
		instance_destroy(_top)
	}
}
else
{
	destroy_time --
	if(destroy_time <= 0)
	{

		instance_destroy()
		instance_destroy(_body)
		instance_destroy(_bottom)
		instance_destroy(_top)
	}
}
if hitbox
{
if(place_meeting(x,y,obj_battle_arrow)){
	scr_chara_hurt(obj_battle.battle_chara_now,damage) 
}
}