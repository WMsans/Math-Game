if(global.setting) exit;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_button);
draw_set_color(c_white);
//animate the arrow
if(timer1<=0){
	if(abs(dir-angle1)<=sub){
		angle1=dir;
		dir=-dir;
	}else if(dir>0)
		angle1+=dir/(dir-angle1);
	else angle1-=dir/(dir-angle1);
	timer1=delay1;
}else timer1--;
arrow_img=(arrow_img+10/60)%4;

//animate button
for(var i=0;i<button_num;i++){
	nowscale[i]+=(tarscale[i]-nowscale[i])/5;
}
button_nowx+=(button_tarx-button_nowx)/5;
button_nowy+=(button_tary-button_nowy)/5;

switch(button_num){
	case 1:
		tarscale[1]=1.1;
		draw_text(640,576-button_nowy,"New Game");
		draw_sprite_ext(spr_button2_start,1,640,576-button_nowy,nowscale[1],nowscale[1],0,c_white,1);
		draw_sprite_ext(spr_textbox_arrow,arrow_img,640-64-sprite_get_width(sprite_index)/2,576-button_nowy,1,1,angle1,c_white,1);
		
		if(keyboard_check_pressed(global.keyz)&&button_tary==0){
			scr_fadeout(global.checkpoint_rm,global.checkpoint_x,global.checkpoint_y);
		}
		break;
	case 2:

		draw_sprite_ext(spr_button2,!choice,640,512-button_nowy,nowscale[0],nowscale[0],0,c_white,1);//start button
		draw_sprite_ext(spr_button2,choice,640,608-button_nowy,nowscale[1],nowscale[1],0,c_white,1);//remap button
		if(keyboard_check_pressed(global.keyup)||keyboard_check_pressed(global.keydown)){
			choice=(choice+1)%2;
		}
		if(!choice){
			draw_text_color(640,512-button_nowy,"New Game",c_yellow,c_yellow,c_white,c_white,1);
			draw_text(640,608-button_nowy,"Setting");
			tarscale[0]=1.1;
			tarscale[1]=1;
			
			tarx=640-64-sprite_get_width(spr_button2_start)/2;
			tary=512-button_nowy;
			if(keyboard_check_pressed(global.keyz)&&button_tary==0){
				scr_fadeout(global.checkpoint_rm,global.checkpoint_x,global.checkpoint_y);
			}
		}else{
			draw_text_color(640,608-button_nowy,"Setting",c_yellow,c_yellow,c_white,c_white,1);
			draw_text(640,512-button_nowy,"New Game");
			tarscale[1]=1.1;
			tarscale[0]=1;
			
			tarx=640-64-sprite_get_width(spr_button2)/2;
			tary=608-button_nowy;
			if(keyboard_check_pressed(global.keyz)&&button_tary==0){
				if(!instance_exists(obj_setting)&&setting_cnt++){
					instance_create_layer(-999,-999,"setting",obj_setting);
					setting_cnt=0;
				}
			}
		}
		
		#region animate arrow movement
		if(nowx==0||nowy==0){
			nowx=tarx;
			nowy=tary;
		}else{
			nowx+=(tarx-nowx)/5;
			nowy+=(tary-nowy)/5;
		}
		#endregion
		draw_sprite_ext(spr_textbox_arrow,arrow_img,nowx,nowy,image_xscale,image_yscale,angle1,c_white,1);
		
		break;
	case 3:
		draw_sprite_ext(spr_button2,!choice,640,448-button_nowy,nowscale[0],nowscale[0],0,c_white,1);//start button
		draw_sprite_ext(spr_button2,(choice==1),640,544-button_nowy,nowscale[1],nowscale[1],0,c_white,1);//remap button
		draw_sprite_ext(spr_button2,(choice==2),640,640-button_nowy,nowscale[2],nowscale[2],0,c_white,1);//quit button
		if(keyboard_check_pressed(global.keydown)){
			choice=(choice+1)%3;
		}
		if(keyboard_check_pressed(global.keyup)){
			choice--;
			if(choice<0) choice=2;
		}
		if(choice==0){
			draw_text_color(640,448-button_nowy,"New Game",c_yellow,c_yellow,c_white,c_white,1);
			draw_text(640,544-button_nowy,"Setting");
			draw_text(640,640-button_nowy,"Quit Game");
			tarscale[0]=1.1;
			tarscale[1]=1;
			tarscale[2]=1;
			
			tarx=640-64-sprite_get_width(spr_button2_start)/2;
			tary=448-button_nowy;
			if(keyboard_check_pressed(global.keyz)&&button_tary==0){//clicked "Start"
				with(obj_title_greetingcharacter){
					scr_game_txt_greeting(after_greeting);
					if(greeting_sentencenum) other.button_tary=-999;
					else scr_fadeout(global.checkpoint_rm,global.checkpoint_x,global.checkpoint_y);
				}
				
			}
		}else if(choice==1){
			draw_text_color(640,544-button_nowy,"Setting",c_yellow,c_yellow,c_white,c_white,1);
			draw_text(640,448-button_nowy,"New Game");
			draw_text(640,640-button_nowy,"Quit Game");
			tarscale[1]=1.1;
			tarscale[0]=1;
			tarscale[2]=1;
			
			tarx=640-64-sprite_get_width(spr_button2)/2;
			tary=544-button_nowy;
			if(keyboard_check_pressed(global.keyz)&&button_tary==0){
				if(!instance_exists(obj_setting)&&setting_cnt++){
					instance_create_layer(-999,-999,"setting",obj_setting);
					setting_cnt=0;
				}
			}
		}else{
			draw_text(640,448-button_nowy,"New Game");
			draw_text(640,544-button_nowy,"Setting");
			draw_text_color(640,640-button_nowy,"Quit Game",c_yellow,c_yellow,c_white,c_white,1);
			tarscale[2]=1.1;
			tarscale[0]=1;
			tarscale[1]=1;
			
			tarx=640-64-sprite_get_width(spr_button2)/2;
			tary=640-button_nowy;
			if(keyboard_check_pressed(global.keyz)&&button_tary==0){
				game_end();
			}
		}
		
		#region animate arrow movement
		if(nowx==0||nowy==0){
			nowx=tarx;
			nowy=tary;
		}else{
			nowx+=(tarx-nowx)/5;
			nowy+=(tary-nowy)/5;
		}
		#endregion
		draw_sprite_ext(spr_textbox_arrow,arrow_img,nowx,nowy,image_xscale,image_yscale,angle1,c_white,1);
		
		break;
	case 4:
		draw_sprite_ext(spr_button2,!choice,640,384-button_nowy,nowscale[0],nowscale[0],0,c_white,1);//start button
		draw_sprite_ext(spr_button2,(choice==1),640,480-button_nowy,nowscale[1],nowscale[1],0,c_white,1);//reset button
		draw_sprite_ext(spr_button2,(choice==2),640,576-button_nowy,nowscale[2],nowscale[2],0,c_white,1);//remap button
		draw_sprite_ext(spr_button2,(choice==3),640,672-button_nowy,nowscale[3],nowscale[3],0,c_white,1);//qiut button
		if(keyboard_check_pressed(global.keydown)){
			choice=(choice+1)%4;
		}
		if(keyboard_check_pressed(global.keyup)){
			choice--;
			if(choice<0) choice=3;
		}
		
		if(choice==0){
			draw_text_color(640,384-button_nowy,"Load File",c_yellow,c_yellow,c_white,c_white,1);
			draw_text(640,480-button_nowy,"New Game");
			draw_text(640,576-button_nowy,"Setting");
			draw_text(640,672-button_nowy,"Quit Game");
			tarscale[0]=1.1;
			tarscale[1]=1;
			tarscale[2]=1;
			tarscale[3]=1;
			
			tarx=640-64-sprite_get_width(spr_button2_start)/2;
			tary=384;
			if(keyboard_check_pressed(global.keyz)&&button_tary==0){
				scr_fadeout(global.checkpoint_rm,global.checkpoint_x,global.checkpoint_y);
			}
		}else if(choice==1){
			draw_text(640,384-button_nowy,"Load File");
			draw_text_color(640,480-button_nowy,"New Game",c_yellow,c_yellow,c_white,c_white,1);
			draw_text(640,576-button_nowy,"Setting");
			draw_text(640,672-button_nowy,"Quit Game");
			tarscale[1]=1.1;
			tarscale[0]=1;
			tarscale[2]=1;
			tarscale[3]=1;
			
			tarx=640-64-sprite_get_width(spr_button2_start)/2;
			tary=480-button_nowy;
			if(keyboard_check_pressed(global.keyz)&&button_tary==0){
				scr_resetgame();
				scr_fadeout(global.checkpoint_rm,global.checkpoint_x,global.checkpoint_y);
			}
		}else if(choice==2){
			draw_text(640,384-button_nowy,"Load File");
			draw_text(640,480-button_nowy,"New Game");
			draw_text_color(640,576-button_nowy,"Setting",c_yellow,c_yellow,c_white,c_white,1);
			draw_text(640,672-button_nowy,"Quit Game");
			tarscale[2]=1.1;
			tarscale[0]=1;
			tarscale[1]=1;
			tarscale[3]=1;
			
			tarx=640-64-sprite_get_width(spr_button2)/2;
			tary=576-button_nowy;
			if(keyboard_check_pressed(global.keyz)&&button_tary==0){
				if(!instance_exists(obj_setting)&&setting_cnt++){
					instance_create_layer(-999,-999,"setting",obj_setting);
					setting_cnt=0;
				}
			}
		}else if(choice==3){
			draw_text(640,384-button_nowy,"Load File");
			draw_text(640,480-button_nowy,"New Game");
			draw_text(640,576-button_nowy,"Setting");
			draw_text_color(640,672-button_nowy,"Quit Game",c_yellow,c_yellow,c_white,c_white,1);
			tarscale[2]=1;
			tarscale[0]=1;
			tarscale[1]=1;
			tarscale[3]=1.1;
			
			tarx=640-64-sprite_get_width(spr_button2)/2;
			tary=672-button_nowy;
			if(keyboard_check_pressed(global.keyz)&&button_tary==0){
				game_end();
			}
		}
		
		#region animate arrow movement
		if(nowx==0||nowy==0){
			nowx=tarx;
			nowy=tary;
		}else{
			nowx+=(tarx-nowx)/5;
			nowy+=(tary-nowy)/5;
		}
		#endregion
		draw_sprite_ext(spr_textbox_arrow,arrow_img,nowx,nowy,image_xscale,image_yscale,angle1,c_white,1);
		
		break;
}
