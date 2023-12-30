enum MOVING_STATE{
	intro,
	idle,
	running,
	slash,
	slashHB,
	runslash,
	skill
}
scr_battle_init_charay();
initflag=false;
energy=0;

//moving
hsp=0;
vsp=0;
max_sp=5;
//keys
key_left=0;
key_right=0;
key_down=0;
key_up=0;
//movement
accel=1.5;
decel=-2;
dirv=0;
dirh=0;
last_dirv=0;
last_dirh=0;

chara_state=MOVING_STATE.idle;
guiwei=false;
slash_anim = noone;
	
//animation
facing=-1;
image_index=11;
flashalpha=0;
flashcolor=c_white;
_flag = true
_closobj = noone;
_closdis = 999;

//damage
inv=0;
