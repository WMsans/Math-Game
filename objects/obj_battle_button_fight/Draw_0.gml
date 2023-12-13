draw_sprite_ext(sprite_index,image_index,x,y+substract_y,image_xscale,image_yscale,0,c_white,1);
//Button text 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_button);
if(obj_battle.button_choice[obj_battle.battle_chara_now]==1){
	draw_text_color(x,y+substract_y,"FIGHT",c_yellow,c_yellow,c_white,c_white,1);
}else{
	draw_text_color(x,y+substract_y,"FIGHT",c_orange,c_orange,c_white,c_white,1);
}