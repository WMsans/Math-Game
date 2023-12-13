/// @description 
event_inherited();
enum STATE{
	front,
	left,
	right,
	back,
	front_talk,
	left_talk,
	right_talk,
	back_talk
}
default_state=STATE.front;
state=STATE.front;

scr_NPC_loadspr(spr_natasha,spr_natasha_side,spr_natasha_side,spr_natasha_back,spr_natasha,spr_natasha_side,spr_natasha_side,spr_natasha_back);
swap_side=true;