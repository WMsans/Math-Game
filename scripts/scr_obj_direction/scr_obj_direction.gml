function scr_obj_direction(_id1,_id2){//方向，1上2左3右4下
	var x1=_id1.x;
	var x2=_id2.x;
	var y1=_id1.y;
	var y2=_id2.y;
	
	if(x1<x2){
		if(y1<y2){//右下
			if(abs(x1-x2)<abs(y1-y2)){
				return 1;
			}else{
				return 3;
			}
		}else{//右上
			if(abs(x1-x2)<abs(y1-y2)){
				return 4;
			}else{
				return 3;
			}
		}
	}else{
		if(y1<y2){//左下
			if(abs(x1-x2)<abs(y1-y2)){
				return 1;
			}else{
				return 2;
			}
		}else{//左上
			if(abs(x1-x2)<abs(y1-y2)){
				return 4;
			}else{
				return 2;
			}
		}
	}
}