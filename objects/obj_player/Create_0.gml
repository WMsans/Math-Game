event_inherited();
flashalpha=0;
flashcolor=c_white;
#region state machine
enum PLAYER_OVERWORLD_STATE{
	normal,
	fight,
	normalskill,
	fightskill,
	fightslash
}
player_overworld_state=PLAYER_OVERWORLD_STATE.normal;

state_machine[PLAYER_OVERWORLD_STATE.normal]=scr_player_normal;
state_machine[PLAYER_OVERWORLD_STATE.normalskill]=scr_player_normalskill;
#endregion
hsp=0;
vsp=0;
max_sp=5;
inv=50;
//keys
key_left=0;
key_right=0;
key_down=0;
key_up=0;
//movement
accel=1;
decel=-1.2;
dirv=0;
dirh=0;
last_dirv=0;
last_dirh=0;
//animation
initflag=1;
facing=-1;
scr_load_character_spr(global.charanowleader);
skill_init=1;

#region character following 
array_size=256;
for(var i=0;i<array_size;i++){
	follower_x[i]=x;
	follower_y[i]=y;
	follower_face[i]=facing;
}
//create follower
if(global.charanowleader==1){
	for(var i=2;i<=global.charanum;i++){
		global.charainst[i]=instance_create_layer(x,y,"Instances",obj_follower);
		with(global.charainst[i]){
			chara_num=i;
			scr_load_character_spr(i);
		}
	}
}else{
	for(var i=2;i<=global.charanum;i++){
		if(i==global.charanowleader){
			global.charainst[i]=instance_create_layer(x,y,"Instances",obj_follower);
			with(global.charainst[i]){
				chara_num=i;
				scr_load_character_spr(1);
			}
		}else{
			global.charainst[i]=instance_create_layer(x,y,"Instances",obj_follower);
			with(global.charainst[i]){
				chara_num=i;
				scr_load_character_spr(i);
			}
		}
	}
}

#endregion
actually_showing=1;

if(instance_exists(obj_lighting_init))
	instance_create_depth(x,y,0,obj_characterlight);