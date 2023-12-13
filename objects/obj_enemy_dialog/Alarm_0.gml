/// @description 
inst=instance_create_depth(x,y,depth-1,obj_battle_text);
inst.text=scr_enemy_dialog_get();
inst.text_color=c_black;
inst.text_fnt=fnt_enemy_dialog;
inst.can_destroy=true;