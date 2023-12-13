/// @description 添加敌人到list

for(var i=1;i<=scr_enemynum(global.next_enemy_id);i++){//generate enemies
	with(scr_enemy_add(scr_enemy_preset(global.next_enemy_id,i))){
		scr_battleenemy_init(global.next_enemy_id,i);
		
	}
}
