/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(firing)
{
	audio_emitter_position(weapon_audio_emitter, x, y, 0);
	audio_play_sound_at(sound2, x, y, 0, 100, 1000, 1, false, 1);
	// 1000000 for 1 second, firespeed is rounds / second
	if(get_timer() - fireTimer > 1000000 / fireSpeed) 
	{
		// create a projectile and lob it at the current weapons aiming direction
		var bullet = instance_create_layer(x, y, "Instances", obj_projectile);
		bullet.direction = direction;
		bullet.image_angle = image_angle;
		bullet.range = range;
		bullet.damage = damage;
		bullet.auPerSecond = projectileSpeed;
		bullet.fire = true;
	}
}

// only for playing the conclusion audio to the gun sounds
// this way it doesn't sound so abrupt when it ends.
if(stopFiring)
{
	firing = false;
	stopFiring = false;
	audio_play_sound_on(weapon_audio_emitter, sound3, false, 2);
}

// muzzle flashes
if(firing && muzzleFlash)
{
	muzzleFlash = false;
	light.R = onR;
	light.G = onG;
	light.B = onB;
}
else
{
	light.R = 0.0;
	light.G = 0.0;
	light.B = 0.0;	
}

// only for timing the muzzle flash. Not connected to audio timing!
if(get_timer() - flashRate > 50000 &&
	firing)
{
	muzzleFlash = true;
	flashRate = get_timer();
}