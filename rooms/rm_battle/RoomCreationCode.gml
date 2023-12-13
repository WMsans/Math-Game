if(!instance_exists(obj_DEBUG)) instance_create_depth(-999,-999,0,obj_DEBUG);
if(!instance_exists(obj_battle)) instance_create_depth(-999,-999,0,obj_battle);
if(!instance_exists(obj_battle_textbox)) instance_create_layer(856,640,"Instances",obj_battle_textbox);
if(!instance_exists(obj_drawsorter)) instance_create_layer(-999,-999,"Instances",obj_drawsorter);

scr_battle_init_charay();
scr_ui_dialog_init();