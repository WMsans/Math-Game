///@arg soundid
///@arg priority
///@arg loops
function scr_cutscene_play_sound(){
	audio_play_sound(argument0,argument1,argument2);
	scr_cutscene_end_action();
}