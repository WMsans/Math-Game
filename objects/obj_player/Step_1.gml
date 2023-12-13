/// @description initilize
//initilize
if(initflag){
	initflag=0;
	facing=-1;
	scr_load_character_spr(global.charanowleader);
	skill_init=1;
}
//skill
if(skill_init){
	scr_battlingskill_init(global.charanowleader);
	skill_init=0;
}