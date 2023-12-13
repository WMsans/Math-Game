//draw_sprite_ext(spr_big_pixel,0,x,y,width/2,height/2,0,c_white,1);
//draw_sprite_ext(spr_big_pixel,0,x,y,width/2-10,height/2-10,0,c_black,1);
draw_set_color(c_white);
draw_rectangle(432,520,1280,720,0);
draw_set_color(c_black);
draw_rectangle(432+10,520+10,1280-10,720-10,0);
