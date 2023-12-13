/// @description destroy all char
char_x=0;
char_y=0;

for(var process=0;process<ds_list_size(char_list);process++){
	if(instance_exists(ds_list_find_value(char_list,process))){
		instance_destroy(ds_list_find_value(char_list,process));
	}
}
ds_list_clear(char_list);