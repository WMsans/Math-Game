function scr_hit_by_skillslash(){
	if(variable_instance_exists(self, "sign_id") && sign_id == "2.darkcrystal"){
		scr_breakable_take_damage();
	}
}