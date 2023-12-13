box_x=camera_get_view_x(view_camera[0]);
box_y=camera_get_view_y(view_camera[0]);
x=box_x+camera_get_view_width(view_camera[0])/2;
y=box_y+camera_get_view_height(view_camera[0])/2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_init);

draw_self();

if(arrow_pos==0){
	arrow_tarx=x;
	arrow_tary=y;
	draw_text_color(x-256,y+164,"Save",c_white,c_white,c_white,c_white,1);
	draw_text_color(x+184,y+164,"Return to game",c_white,c_white,c_white,c_white,1);
}else if(arrow_pos==1){
	arrow_tarx=x-256;
	arrow_tary=y+164;
	draw_text_color(x-256,y+164,"Save",c_yellow,c_yellow,c_white,c_white,1);
	draw_text_color(x+184,y+164,"Return to game",c_white,c_white,c_white,c_white,1);
}else if(arrow_pos==2){
	arrow_tarx=x+184;
	arrow_tary=y+164;
	draw_text_color(x-256,y+164,"Save",c_white,c_white,c_white,c_white,1);
	draw_text_color(x+184,y+164,"Return to game",c_yellow,c_yellow,c_white,c_white,1);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(x-sprite_width/2+border,y-sprite_height/2+border,room_get_name(room));

//selection
if(arrow_pos==0){
	if(keyboard_check_pressed(global.keydown)||keyboard_check_pressed(global.keyleft)){
		arrow_pos=1;
	}
	if(keyboard_check_pressed(global.keyright)){
		arrow_pos=2;
	}
}else if(arrow_pos==1){
	if(keyboard_check_pressed(global.keyright)){
		arrow_pos=2;
	}
	if(keyboard_check_pressed(global.keyz)){//Save game
		global.checkpoint_rm=room;
		global.checkpoint_x=obj_player.x;
		global.checkpoint_y=obj_player.y;
		global.checkpoint_id=id;
		scr_savegame();
		scr_create_chatbox("saved");
		instance_destroy();
	}
}else if(arrow_pos==2){
	if(keyboard_check_pressed(global.keyleft)){
		arrow_pos=1;
	}
	if(keyboard_check_pressed(global.keyz)){//rm goto title
		instance_destroy();
	}
}

//arrow animate
	//set the angle
if(timer1<=0){
	if(abs(dir-angle1)<=sub){
		angle1=dir;
		dir=-dir;
	}else if(dir>0)
		angle1+=dir/(dir-angle1);
	else angle1-=dir/(dir-angle1);
	timer1=delay1;
}else timer1--;
	//set the img
arrow_img=(arrow_img+10/60)%4;
	//animate location
if(arrow_x==-999||arrow_y==-999){
	arrow_x=arrow_tarx;
	arrow_y=arrow_tary;
}
arrow_x+=(arrow_tarx-arrow_x)/4;
arrow_y+=(arrow_tary-arrow_y)/4;
	//draw the arrow
draw_sprite_ext(spr_textbox_arrow,arrow_img,arrow_x,arrow_y,1,1,angle1,c_white,0.7);