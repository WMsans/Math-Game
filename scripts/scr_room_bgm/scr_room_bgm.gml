function scr_room_bgm(_room_num){
	switch(_room_num){
		#region into forest
		case rm_01:
			return mus_intoforest;
			break;
		#endregion
		
		#region darkroom
		case black_room:
			return mus_darkroom;
			break;
		#endregion
	}
}