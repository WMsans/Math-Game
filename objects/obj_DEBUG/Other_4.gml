///@description Creat map
#macro TS 32
var _w=ceil(room_width-TS)/2;
var _h=ceil(room_height-TS)/2;

global.mp_grid=mp_grid_create(0,0,_w,_h,TS,TS);
mp_grid_add_instances(global.mp_grid,obj_block,false);
mp_grid_add_instances(global.mp_grid,obj_block_untransparent,false);