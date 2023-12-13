//Button text 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_button);

if(hover){
	tarscale=1.1;
}else{
	tarscale=1;
}
image_xscale+=(tarscale-image_xscale)/4;
image_yscale+=(tarscale-image_yscale)/4;

image_index=hover;
draw_self();
if(!hover){
	draw_set_color(c_orange);
	//draw_rectangle(x1,y1,x2,y2,1);
	draw_text_color(x,y,text,c_orange,c_orange,c_white,c_white,1);
} else{
	//draw_rectangle(x1,y1,x2,y2,0);
	draw_set_color(c_yellow);
	draw_text_color(x,y,text,c_yellow,c_yellow,c_white,c_white,1);
	
}
