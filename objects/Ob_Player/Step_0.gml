
if (hp > 0)
{
	var dx = 0
	var dy = 0
	
	if (keyboard_check(ord("A"))) 
	{
		dx -= 2
	}
	if (keyboard_check(ord("D"))) 
	{
		dx += 2
	}
	if (keyboard_check(ord("W"))) 
	{
		dy -= 2
	}
	if (keyboard_check(ord("S"))) 
	{
		dy += 2
	}
	move_and_collide(dx, dy, Ob_ParentWall)
	
	if (image_alpha != 1)
	{
		sprite_index = Sp_Player_Hit	
	}
	else
	{
		sprite_index = Sp_Player //Не нравится, потому что, возможно, игра будет пытаться выставить спрайт сп_плеер даже когда это не нужно будет
	}

}

if (hp <= 0)
{
	sprite_index = Sp_Player_Dead
	is_invincible = true
	if (keyboard_check(ord("R")))
	{
		game_restart()
	}
	
}
