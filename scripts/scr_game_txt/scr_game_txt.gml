function scr_game_txt(_text_id){//translate
	switch(_text_id){
		#region sign
		case"saved":
			scr_text("Your game progress has been successfully saved as a file.");
			break;
		case"sign1"://引索
			scr_text("Hi. I'm the first sign...");
			scr_text("I'm blue now!");
				scr_text_color(4,8,c_blue,c_blue,c_white,c_white,);//更改颜色，顺序：左上，右上，左下，右下
			scr_text("I can even talk like a ghost!");
				scr_text_float(23,29);//漂浮字
			scr_text("Or like i'm frightened.");
				scr_text_shake(12,22);//抖动字
			scr_text("Do you want to check out the sign on the left?agiuviskn ","init2",-1)
			scr_options("I'm not sure...","sign1-unsure");//选项1
			scr_options("Not that sign","sign1-neither");//选项2
			scr_options("YeahYeahYeah","sign1-yes");//选项3
			scr_options("NopeNope","sign1-no");//选项4
				scr_option_color(c_red,c_red,c_white,c_white);//更改选项颜色
			break;
		case"sign1-yes":
			scr_text("Yehhhh! I'm so happy!","init2");
			break;
		case"sign1-no":
			scr_text("Ahhhhh! I'm so sad!","init2",-1);
			break;
		case"sign1-unsure":
			scr_text("I'd love to see you doing so!","init2",1);
			break;
		case "sign1-neither":
			scr_text("Oh...But that's the only one in this room except me!")
			break;
		case"sign2":
			scr_text("Hi! I'm the second sign!","init");
			scr_text("Now I have a portrait!","init");
			scr_text("I can also save for you!","init");
			scr_text("But you never told me that you can save!","init2",-1);
			scr_text("l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g ","init2",-1);
			scr_text("l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g l o n g ","init");
			savebox=true;
			break;
		case"block1":
			scr_text("Hi! I'm the first block which can talk!");
			scr_text("I'd like to help you save!");
			scr_text("(please keep that as secret!)");
				scr_text_float(21,27);
			savebox=true;
			break;
		case"sign3":
			scr_text("Hi. I'm a textblock...");
			scr_text("Actually, my name is just text block...");
			scr_text("I guess we'll meet someday later");
			scr_text("Actually, I'd like to leave you an apple as a gift...")
			scr_item_add(1);
			scr_text("*You get an apple");
			break;
		case"1.dirtybed":
			scr_text("A dirty bed.");
			scr_text("It's too dirty. You don't want to touch it.");
			break;
		case"2.darkcrystal":
			if(global.plot < plots.get_sword){
				scr_text("Bright sunlight comes through the crystal.");
				scr_text("Are there anything to break it?");
				if(instance_exists(obj_darkcrystal_right)){
					if(obj_darkcrystal_right.flag >= 1){
						scr_text("Something like... a sword?");
					}
					obj_darkcrystal_right.flag++;
				}
			}else if(global.charaweapon[global.charanowleader] != 7){//进入森林
				scr_text("Press " + keychecks(global.keya) + " to select the slash skill, and press " + keychecks(global.keyx) + " to use it!");
			}else{
				scr_text("Press " + keychecks(global.keyc) + " to equip the sword.");
				
			}
			break;
		case"3.seelight":
			scr_text("Due to darkness, you can't see the beautiful pattern on the wall...");
			scr_text("What a pity.");
			break;
		case"4.mirror":
			scr_text("Why can't you see yourself in the mirror?");
			break;
		case"5.toilet":
			scr_text("A toilet.");
			scr_text("It doesn't help, for now.");
			break;
		case"6.clean bottle":
			scr_text("A cleaner.");
			scr_text("Do you want to pick it up?");
			scr_options("Yes.","6.clean bottle-yes");
			scr_options("No.","6.clean bottle-no");
			break;
		case"6.clean bottle-yes":
			scr_item_add(8);
			if(instance_exists(obj_bottle))instance_destroy(obj_bottle);
			scr_text("You get a cleaner bottle.");
				scr_text_color(10,24,c_yellow,c_yellow,c_white,c_white);
			scr_text("Press "+keychecks(global.keyc)+" to use the item.");
			break;
		case"6.clean bottle-no":
			scr_text("You decided to explore elsewhere.");
			break;
		case"7.cleanbed":
			var flag=1;
			for(var i=1;i<=global.item_num;i++) if(global.item[i]==9) flag=0;
			if(flag) scr_item_add(9);
			scr_text("You found a game controller under the pillow.");
			scr_text("But you can't see what's on the controller because of the dim light.");
			scr_text("Maybe try check it at somewhere brighter...");
			break;
		case "8.unsheathe":
			scr_text("Do you want to unsheathe the sword?");
			scr_options("Yes.","8.unsheathe-yes");
			scr_options("No.","8.unsheathe-no");
			break;
		case "8.unsheathe-yes":
			scr_text_create_cutscene([
				[scr_cutscene_change_variable,obj_player,"image_alpha",0],
				[scr_cutscene_instance_create,obj_player.x,obj_player.y,"Instances",obj_player_skilllearn],
				[scr_cutscene_wait,3],
				[scr_cutscene_text,"skilllearn_sword"],
				[scr_cutscene_change_variable,obj_player,"image_alpha",1],
				[scr_cutscene_change_global_variable, "plot", plots.get_sword],
				[scr_cutscene_instance_destroy,obj_player_skilllearn]
			]
			);
			break;
		case "8.unsheathe-no":
			scr_text("Are there's anything more important to do?");
			break;
		case "9.into forest":
			scr_text("Into the calming forest.");
			scr_text("You feel a sense of connection...");
			scr_text("Your HP fully recovered.");
			savebox = true;
			break;
		case "10.letter to adventurer":
			scr_text("To dear adventurers who acciddentally wanders here:");
			scr_text("Welcome to the forest, the last unsettled part of the Forest Kingdom!");
			scr_text("I'm the ranger of this forest. Please head east if you are lost.");
			scr_text("What to explore here: Go North for some food. Go Southeast for the Heart of Forest.");
			scr_text("You'll see signs along the way. They will lead you to my outpost: a lodge on the border of the Forest Kingdom.");
			break;
		case "11.forest chest":
			scr_text("A jar filled with candy.");
			scr_text("\"To dear adventurers: please take only one piece.\"");
			scr_text("\"There may be future adventurers!\"");
			scr_options("Take one", "11.after take");
			scr_options("Leave", "11.leave");
			break;
		case"11.take":
			if(global.candytook == 0){
				scr_text("You take one piece.");
			}else if(global.candytook == 1){
				scr_text("You take another piece.");
				scr_text("How disgusting...");
			}else if(global.candytook == 2){
				scr_text("Good luck when meeting the ranger.");
			}else if(global.candytook >= 3){
				scr_text("How dare you...");
			}
			global.candytook++;
			scr_item_add(10);
			
			break;
		case"11.after take":
			if(global.plot <= plots.into_forest){
				scr_create_cutscene([
					[scr_cutscene_text,"11.take"],
					[scr_cutscene_text,"11.enemy_approching"],
					[scr_cutscene_move_chara,obj_player, obj_player.x, 360, false, 3],
					[scr_cutscene_layer_shake,5,20,"Tiles_bushes"]
				]);
			}else scr_game_txt("11.take");
			
			break;
		case"11.enemy_approching":
			scr_text("You feel there is something in the bushes.");
			break;
		case"11.leave":
			scr_text("You decided to leave it for after comers.");
			break;
		#endregion
		#region cutscene
		case"cutscene1":
			scr_text("Cutscene1 ended successfully!");
			scr_text("Do you want to retry?");
			scr_options("YeahYeahYeah","sign1-yes");
			scr_options("NopeNope","sign1-no");
			break;
		case"cutscene2":
			scr_text("Locked by a combination lock.");
			scr_text("Try to unlock it?");
			scr_options("Yes","cutscene2_green_good");
			scr_options("No","cutscene2_cancled");
			break;
		case"cutscene2_cancled":
			scr_text("You decided to look for password elsewhere.");
			break;
		case"cutscene2_green_good":
			if(global.plot<plots.game_controller_checked){
				scr_text("You decided to look for password elsewhere.");
			}else{
				scr_text("What is the green digit?");
				scr_options("M","cutscene2_red_good");
				scr_options("B","cutscene2_bad");
				scr_options("A","cutscene2_bad");
			}
			break;
		case"cutscene2_red_good":
			scr_text("What is the red digit?");
			scr_options("X","cutscene2_bad");
			scr_options("Y","cutscene2_bad");
			scr_options("A","cutscene2_blue_good");
			break;
		case"cutscene2_blue_good":
			scr_text("What is the blue digit?");
			scr_options("B","cutscene2_unlocked");
			scr_options("X","cutscene2_bad");
			scr_options("1","cutscene2_bad");
			break;
		case"cutscene2_unlocked":
			scr_text("You hear a tick. Something opened.");
			global.plot=plots.combination_lock_solved;
			break;
		case"cutscene2_bad":
			scr_text("The lock got stucked.");
			break;
		
		case"cutscene3_storybegin":
			scr_text("You find yourself in a dark room.");
			scr_text("Light comes through the door. You need to get out.");
			scr_text("Press "+keychecks(global.keyright)+", "+keychecks(global.keyleft)+", "+keychecks(global.keyup)+", and "+keychecks(global.keydown)+" to walk around.");
			break;
		case"cutscene3_keyz":
			scr_text("Press " + keychecks(global.keyz) + " to interact with surroundings.");
			break;
		case"cutscene4_itemuse":
			scr_text("Certain events can be triggered by using certain items while next to objects.");
			scr_text("For example, try to use the cleaner next to the bed.");
			break;
		case"skilllearn_sword":
			scr_text("You get the wooden sword.");
			scr_text("Open your backpack to use it.");
			scr_item_add(3);
			break;
		#endregion
		#region item using
		case"apple":
			scr_text("You ate an apple...");
			scr_text("You feel awesome!");
			break;
		case"banana":
			scr_text("You ate a banana...");
			scr_text("You feel...very banana.");
			break;
		case"woodensword-Natasha":
			scr_text("I'm not going to use this poor sword.");
			break;
		case"iron_sword":
			scr_text("You equiped the iron sword.");
			break;
		case"use clean bottle":
			scr_text("You used the bottle on the bed.");
			scr_text("The bed is now clean!");
			break;
		case"use clean bottle wrong":
			scr_text("This bottle of cleaner is lightly scented.");
			scr_text("Maybe you can use it on something...dirty?");
			if(variable_global_exists("usecleanbottlewrong")) scr_text("Try to use the item by the side of the disgusting bed.");
			variable_global_set("usecleanbottlewrong",1);
			break;
		case"use controller":
			scr_text("Under the light, you see the missing keys are...");
			scr_text("...M, A, and B");
				scr_text_color(3,3,c_green,c_green,c_white,c_white);
				scr_text_color(6,6,c_red,c_red,c_white,c_white);
				scr_text_color(13,13,c_blue,c_blue,c_white,c_white);
			global.plot=plots.game_controller_checked;
			break;
		case"use controller wrong":
			scr_text("Some of the buttons are missing, but you can't see clearly...");
			scr_text("Maybe you can see more clearly at brighter places?");
			
			break;
		case"Forest Candy":
			scr_text("You eat the candy wrapped by leaves.");
			if(global.candytook <= 1){
				scr_text("You feel the faint scent of the forest in your mouth. You recovered 5 HP.");
			}else{
				scr_text("You feel the past guilty in your mouth. You recovered 5 HP.");
			}
			break;
		#endregion
		#region item picking up
		case"item_pick1":
			scr_text("You picked up an apple.");
			break;
		case"item_pick2":
			scr_text("You picked up a banana.");
			break;
		case"item_pick3":
			scr_text("You picked up your first sword.");
			break;
		case"item_pick5":
			scr_text("You picked up a hammer.");
			break;
		case"item_pick6":
			scr_text("You picked up this heavy sword.");
			break;
		case"item_pick8":
			scr_text("You picked up this cleaner bottle.");
			break;
		case"item_pick9":
			scr_text("You picked up this game controller.");
			break;
		#endregion
		#region item combine
		case"combine_fail":
			scr_text("You can't combine these two objects.");
			break;
		case"applebanana":
			scr_text("You smashed the apple and banana together, trying to make an 'applebanana'...");
			scr_text("...But nothing happened");
			break;
		#endregion
	}
}