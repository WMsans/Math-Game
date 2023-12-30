function scr_portrait_decision(_portrait){
	switch(_portrait){
		case "init":
			speaker_spr[page_num]=spr_por_init;
			snd[page_num]=snd_txt_init;
			break;
		#region testing
		case "init2":
			speaker_spr[page_num]=spr_por_init2;//头像sprite
			txtb_spr[page_num]=spr_chatbox_init3;//对话框sprite
			snd[page_num]=snd_txt_init;//声音
			fnt[page_num] = fnt_button;
			break;
		#endregion
		
		
	}
}