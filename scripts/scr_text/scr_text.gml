///@param text
///@param portrait
function scr_text(_text,_portrait){
	text[page_num]=_text;
	scr_text_set_init();
	
	scr_portrait_decision(_portrait);
	
	if(argument_count>2) speaker_side[page_num]=argument[2];
	
	page_num++;
}
