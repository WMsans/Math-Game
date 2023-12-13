scr_roomcode();
scr_play_bgm(mus_darkroom,0,82.28);
if(global.plot==1){//story begin
	show_debug_message("story begin");
	var _scene_info=[
		[scr_cutscene_change_variable,obj_player,"image_alpha",0],
		[scr_cutscene_change_variable,obj_characterlight,"lightrange",1],
		[scr_cutscene_wait,1],
		[scr_cutscene_instance_create,752,208,"Instances",obj_player_dissolving],
		[scr_cutscene_anim_create,obj_player_dissolving,"DissolveAmount",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,0,1,300],
		[scr_cutscene_change_variable,obj_characterlight,"lightspeed",2],
		[scr_cutscene_wait,5],
		[scr_cutscene_change_variable,obj_characterlight,"lightspeed",0],
		[scr_cutscene_text,"cutscene3_storybegin"],
		[scr_cutscene_change_variable,obj_player,"image_alpha",1],
		[scr_cutscene_instance_destroy,obj_player_dissolving]
	];
	scr_create_cutscene(_scene_info);
	global.plot=2;
}