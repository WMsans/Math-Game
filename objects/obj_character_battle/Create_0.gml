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
decel=-1;
dirv=0;
dirh=0;
last_dirv=0;
last_dirh=0;

chara_state=MOVING_STATE.idle;
guiwei=false;
hitbyattack=ds_list_create();
	
//animation
facing=-1;
image_index=11;
flashalpha=0;
flashcolor=c_white;

//damage
inv=0;
