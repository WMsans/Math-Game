///@arg chara_pos
function scr_item_controller(){
	if(room!=rm_battle){//没有战斗，正常执行
		var flag=0;
		if(instance_exists(obj_block_sign_untransparent)){
			with(obj_block_sign_untransparent){
				if(global.expecting_textblock_x==x+(variable_instance_exists(id, "middle_block") ? 0 : sprite_width/2) && global.expecting_textblock_y==y-(variable_instance_exists(id, "middle_block") ? sprite_height/2 : 0)&&sign_id=="3.seelight"){
					flag=1;
				}
			}
		}
		if(instance_exists(obj_darkcrystal_right)){
			with(obj_darkcrystal_right){
				if(global.expecting_textblock_x==x+(variable_instance_exists(id, "middle_block") ? 0 : sprite_width/2) && global.expecting_textblock_y==y-(variable_instance_exists(id, "middle_block") ? sprite_height/2 : 0)){
					flag=1;
				}
			}
		}
		
		if(flag){
			scr_create_chatbox("use controller");
		}else{
			scr_create_chatbox("use controller wrong");
		}
	}else{//battle scripts
		scr_ui_dialog_create("You try to play a game with the enemy...");
		scr_ui_dialog_create("... but neither of you can enjoy because of the missing button.");
		obj_battle.battle_ui_dialog=scr_create_text(432+15+5,520+16,"setting",scr_ui_dialog_get()){
			obj_battle.battle_ui_dialog.can_destroy=1;
		}
	}
}