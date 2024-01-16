///@par Magnitude
///@par Frames
///@par Layer
function scr_cutscene_layer_shake(magnitude,frames,_layer){
	scr_layershake(magnitude,frames,_layer);
	scr_cutscene_end_action();
}