if(!instance_exists(obj_cutscene)){
	var tarx=obj_player.follower_x[record*(chara_num-1)];
	var tary=obj_player.follower_y[record*(chara_num-1)];
	if((abs(tarx-x)<=buff&&abs(tary-y)<=buff)){
		x=tarx;
		y=tary;
	}else{
		x+=(tarx-x)/10;
		y+=(tary-y)/10;
	}

	image_speed=1;
	if(x==xprevious&&y==yprevious){//player stay still
		switch(obj_player.follower_face[record*(chara_num-1)]){
			case -1:
				image_xscale=1;
				sprite_index=spr;
				break;
			case 1:
				image_xscale=1;
				sprite_index=sprback;
				break;
			case 2:
				image_xscale=-1;
				sprite_index=sprside;
				break;
			case -2:
				image_xscale=1;
				sprite_index=sprside;
				break;
		}
	
	}else{//player is moving
		switch(obj_player.follower_face[record*(chara_num-1)]){
			case -1:
				image_xscale=1;
				sprite_index=sprwalk;
				break;
			case 1:
				image_xscale=1;
				sprite_index=sprbackwalk;
				break;
			case 2:
				image_xscale=-1;
				sprite_index=sprsidewalk;
				break;
			case -2:
				image_xscale=1;
				sprite_index=sprsidewalk;
				break;
		}
	}
}
if(inv>0){
	inv--;
}
if(flashalpha>0){
	flashalpha-=0.05;
}
