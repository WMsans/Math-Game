///@arg pos
///@arg tarx
///@arg tary
///@arg relative?
///@arg speed
function scr_cutscene_move_follower(_pos,_tarx,_tary,_relative,_spd){
	scr_cutscene_move_chara(global.charainst[_pos],_tarx,_tary,_relative,_spd);
}