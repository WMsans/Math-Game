/// @description 
event_inherited();
scr_create_cutscene([
	[scr_cutscene_instance_create, 0, 0, "fade", obj_fade_whitescreen],
	[scr_cutscene_instance_create, 0, 0, "fade", obj_fade_whitescreen],
	[scr_cutscene_wait,3],
	[scr_cutscene_room_goto, into_forest, 120, 288, false]
]
);