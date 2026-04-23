/// скрипты при создании
hp = 100;
global_score = 0;
is_invincible = false;

curr_state = states.IDLE;

enum states
{
	IDLE,
	RUNNING,
	ATTACK,
	FLYING_ATTACK,
	INAIR,
	DEAD,
	HIT,
}

self_sprites = 
{
	idle : Sp_Player_Idle,
	running : Sp_Player_Running,
	attack : Sp_Player_Attack,
	flying_attack : Sp_Player_InAirAttack,
	inair_jump : Sp_Player_InAir_UP,
	inair_fall : Sp_Player_InAir_DOWN,
	dead : Sp_Player_Dead,
	hit : Sp_Player_Hit,
}

animation_finished = false;

anim_x = 0;
anim_y = 0;
self_friction = 1.5

hor_speed = 0;
ver_speed = 0;
zax_speed = 0;
self_z = 0;
spd = 5
jump_speed = 10