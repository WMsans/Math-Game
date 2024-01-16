///@arg obj
///@arg tarx
///@arg tary
///@arg relative?
///@arg speed
function scr_cutscene_move_chara(_obj,_tarx,_tary,_relative,_spd){
	if(x_dest==-1){//初始化tarx
		if(!_relative){//不是相对坐标
			x_dest=_tarx;
			y_dest=_tary;
		}else{
			x_dest=_obj.x+_tarx;
			y_dest=_obj.y+_tary;
		}
	}
	var _facing=-1;
	var xx=x_dest;
	var yy=y_dest;
	
	with(_obj){
		if(point_distance(x,y,xx,yy) >= _spd){
			var dir=point_direction(x,y,xx,yy);
			var ldirx=lengthdir_x(_spd,dir);
			var ldiry=lengthdir_y(_spd,dir);
			x+=ldirx;
			y+=ldiry;
			if(ldirx!=0&&ldiry==0) _facing=sign(ldirx)*2;
			else if(ldiry!=0&&ldirx==0) _facing=0-sign(ldiry);
			else if(abs(ldirx)>abs(ldiry)) _facing=sign(ldirx)*2;
			else _facing=0-sign(ldiry);
			
			//animate sprite
			#region sprite animation
			if(object_index == obj_player || object_index == obj_follower){
				image_speed=1;
				switch(_facing){
					case -1:
						sprite_index=sprwalk;
						break;
					case 1:
						sprite_index=sprbackwalk;
						break;
					case 2:
						image_xscale=1;
						sprite_index=sprsidewalk;
						break;
					case -2:
						image_xscale=-1;
						sprite_index=sprsidewalk;
						break;
					case 0:
						
						break;
				}
			}
			#endregion
		}else{
			//animate sprite
			if(object_index == obj_player || object_index == obj_follower) facing=_facing;
			x=xx; y=yy;
			with(other){
				x_dest=-1; y_dest=-1;
				scr_cutscene_end_action();
			}
		}
	}
}