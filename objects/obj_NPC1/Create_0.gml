/// @description 
event_inherited();//Important! Inherit the parent event

default_state=STATE.front;//默认朝向
state=default_state;

//更改spr
scr_NPC_loadspr(spr_natasha,//前
spr_natasha_side,//左
spr_natasha_side,//右
spr_natasha_back,//后
spr_natasha,//前，说话时
spr_natasha_side,//左，说话时
spr_natasha_side,//右，说话时
spr_natasha_back//后，说话时
);

swap_side=true;//左右朝向是否反转