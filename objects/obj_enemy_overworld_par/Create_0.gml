event_inherited();


alart=false;
alart_dist=320;
path=path_add();
move_spd=2;
calc_path_delay=30;
calc_path_timer=irandom(60);

attack_dis=16;

enemy_id=0;

if(ds_list_find_index(global.trigger_enemy_list,id)!=-1){//生成过
	instance_destroy();
}
actually_showing=1;