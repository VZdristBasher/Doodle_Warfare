
var _horiz = keyboard_check(ord("D"))-keyboard_check(ord("A"));
var _vert = keyboard_check(ord("S"))-keyboard_check(ord("W"));
var _jump = keyboard_check_pressed(vk_space);
var _attack = keyboard_check_pressed(ord("J"));

var _grav = 0.5

zax_speed += _grav;
self_z += zax_speed;
self_z = min(0,self_z);

anim_y = self_z;

if(_horiz !=0)
{
	image_xscale = _horiz;
}

switch(curr_state)
{
	case states.IDLE:
		#region
		sprite_index = self_sprites.idle;
	
		//торможение
		if(_horiz !=0 || _vert != 0)
		{
			hor_speed /= (self_friction);
			ver_speed /= (self_friction);
		}
		else
		{
			hor_speed = 0;
			ver_speed = 0;
		}
	
	
		if(_horiz !=0 || _vert != 0)
		{
			curr_state = states.RUNNING;
		}
	
		if(_attack)
		{
			curr_state = states.ATTACK;
			image_index = 0;
		}
	
		if(_jump && self_z == 0)
		{
			curr_state = states.INAIR;
			zax_speed = -jump_speed;
		}
		
		if (image_alpha != 1)
		{
			curr_state = states.HIT;
		}
		
		if(hp <= 0)
		{
			curr_state = states.DEAD;
			spd = 0;
			_horiz = 0;
			_vert = 0;
			is_invincible = true;
			
		}
		
		#endregion
	break;
	
	case states.RUNNING:
		#region
		sprite_index = self_sprites.running;
	
		if(_horiz !=0)
		{
			hor_speed = _horiz * spd;
		}
		else
		{
			hor_speed /= self_friction;
		}
	
		if(_vert !=0)
		{
			ver_speed = _vert * (spd/2);
		}
		else
		{
			ver_speed /= self_friction;
		}
	
		if(_horiz == 0 && _vert == 0)
		{
			curr_state = states.IDLE;
		}
	
		if(_attack)
		{
			curr_state = states.ATTACK;
			image_index = 0;
		}
		
		if(_jump)
		{
			curr_state = states.INAIR;
			zax_speed = -jump_speed;
		}
		
		if (image_alpha != 1)
		{
			curr_state = states.HIT;
		}
		
		if(hp <= 0)
		{
			curr_state = states.DEAD;
			spd = 0;
			_horiz = 0;
			_vert = 0;
			is_invincible = true;
		}
		#endregion
	break;
	
	case states.ATTACK:
		#region
		sprite_index = self_sprites.attack;
	
		hor_speed /= self_friction;
		ver_speed /= self_friction;
		zax_speed = 0;
		self_z = 0;
	
		if(animation_finished)
		{
		curr_state = states.IDLE;
		image_index = -1;
		}
		
		if (image_alpha != 1)
		{
			curr_state = states.HIT;
		}
		
		if(hp <= 0)
		{
			curr_state = states.DEAD;
			spd = 0;
			_horiz = 0;
			_vert = 0;
			is_invincible = true;
		}
		
		#endregion
	break;
	
	case states.HIT:
		#region
		sprite_index = self_sprites.hit
		if(_horiz !=0)
		{
			hor_speed = _horiz * spd;
		}
		else
		{
			hor_speed /= self_friction;
		}
	
		if(_vert !=0)
		{
			ver_speed = _vert * (spd/2);
		}
		else
		{
			ver_speed /= self_friction;
		}
		
		if(image_alpha = 1)
		{
			curr_state = states.IDLE;
		}
		
		#endregion
	break;
	
	case states.INAIR:
		#region
		
		if(zax_speed <= 0)
		{
			sprite_index = self_sprites.inair_jump;
		}
		else
		{
			sprite_index = self_sprites.inair_fall;
		}
		
		if(_horiz !=0)
		{
			hor_speed = _horiz * spd;
		}
		else
		{
			hor_speed /= self_friction;
		}
	
		
		if (self_z >= 0)
		{
			curr_state = states.IDLE;
			zax_speed = 0;
			self_z = 0;
		}
		
		if(_attack)
		{
			curr_state = states.FLYING_ATTACK
			image_index = 0
		}
		
		if (image_alpha != 1)
		{
			curr_state = states.HIT;
		}
		
		if(hp <= 0)
		{
			curr_state = states.DEAD;
			spd = 0;
			_horiz = 0;
			_vert = 0;
			is_invincible = true;
		}
		#endregion
	break;
	
	case states.FLYING_ATTACK:
		#region
		sprite_index = self_sprites.flying_attack;
		
		if (self_z >= 0)
			{
				curr_state = states.IDLE;
				zax_speed = 0;
				self_z = 0;
			}
			
		if(hp <= 0)
			{
			curr_state = states.DEAD;
			spd = 0;
			_horiz = 0;
			_vert = 0;
			is_invincible = true;
			}
		#endregion
	break;
		
	case states.DEAD:
		#region
		sprite_index = self_sprites.dead;
		image_xscale = 1;
		is_invincible = true;
		spd = 0;
		_horiz = 0;
		_vert = 0;
			{
				if(keyboard_check(ord("R")))
				{
					game_restart();
				}
			}
		#endregion
	break;
}

move_and_collide(hor_speed, ver_speed, Ob_ParentWall);

animation_finished = false;