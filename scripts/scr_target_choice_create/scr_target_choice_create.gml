///@arg target_type
function scr_target_choice_create(_target_type){
	switch(_target_type){
		case 1://physics
				randomize();
				var randomnum=irandom_range(0,1);
				battle_targetchoice_inst=instance_create_layer(856+(randomnum ? -400 : 400),620,"anim",obj_battle_targetchoice){
					battle_targetchoice_inst.state=randomnum;
				}
				battle_target_inst=instance_create_layer(856,620,"soul",obj_battle_target);
				battle_target_inst.target_type=global.charabattletarget[battle_fight_nowpos];
			
			break;
		case 2://natural number
				randomize();
				var randomnum=irandom_range(0,1);
				battle_targetchoice_inst=instance_create_layer(856+(randomnum ? -400 : 400),620,"anim",obj_battle_targetchoice){
					battle_targetchoice_inst.state=randomnum;
				}
				battle_target_inst=instance_create_layer(856,620,"soul",obj_battle_target_natural);
				battle_target_inst.target_type=global.charabattletarget[battle_fight_nowpos];
			
			break;
	}
}