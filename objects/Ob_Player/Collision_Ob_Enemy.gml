if (!is_invincible) 
{
    hp -= 10;                
    is_invincible = true;   
    alarm[0] = 60;       
    image_alpha = 0.5;
}