/// @description 
draw_self();
//画数字
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_button);
draw_set_color(c_white);
draw_text(476,y,string(numbers[1]));
draw_text(552,y,string(numbers[2]));
draw_text(642,y,string(numbers[3]));
draw_text(734,y,string(numbers[4]));
draw_text(x,y,string(numbers[5]));
draw_text(x*2-734,y,string(numbers[6]));
draw_text(x*2-642,y,string(numbers[7]));
draw_text(x*2-552,y,string(numbers[8]));
draw_text(x*2-476,y,string(numbers[9]));