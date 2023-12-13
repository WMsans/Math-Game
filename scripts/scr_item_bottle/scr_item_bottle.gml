///@arg chara_pos
function scr_item_bottle(){
	if(room!=rm_battle){//没有战斗，正常执行
		var flag=0;
		if(instance_exists(obj_dirtybed)){
			with(obj_dirtybed){
				if(global.expecting_textblock_x==x+(variable_instance_exists(id, "middle_block") ? 0 : sprite_width/2) && global.expecting_textblock_y==y-(variable_instance_exists(id, "middle_block") ? sprite_height/2 : 0)){
					flag=1;
				}
			}
		}
		if(flag){
			if(instance_exists(obj_dirtybed)){
				var _x=obj_dirtybed.x;
				var _y=obj_dirtybed.y;
				instance_destroy(obj_dirtybed);
				var _clean=instance_create_layer(_x,_y,"Instances",obj_cleanbed);
				_clean.sign_id="cleanbed";
				global.bedcleaned=1;
			}
			scr_create_chatbox("use clean bottle");
			scr_item_remove(selected_item1);
		}else{
			scr_create_chatbox("use clean bottle wrong");
		}
	}else{//battle scripts
		scr_ui_dialog_create("You cleaned yourself. NICE!");
		obj_battle.battle_ui_dialog=scr_create_text(432+15+5,520+16,"setting",scr_ui_dialog_get()){
			obj_battle.battle_ui_dialog.can_destroy=1;
		}
	}
}