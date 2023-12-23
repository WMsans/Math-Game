///@arg var_name_as_string
///@arg value
function scr_cutscene_change_global_variable(){
	variable_global_set(argument0,argument1);
	scr_cutscene_end_action();
}