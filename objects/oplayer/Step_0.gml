//Get player input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_up);

//Calculate movement
var move = key_right - key_left;

hsp = move * walksp;
vsp = vsp + grv;

if(place_meeting(x, y+1, oWall)) && (key_jump){
	vsp = -3;
}

//Horizontal collision
if(place_meeting(x+hsp, y, oWall)){
	while(!place_meeting(x+sign(hsp), y, oWall)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical collision
if(place_meeting(x, y+vsp, oWall)){
	while(!place_meeting(x, y+sign(vsp), oWall)){
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation
if(!place_meeting(x, y+1, oWall)){
	sprite_index = character_jump;
	image_speed = 0;
} else {
	image_speed = 1;
	if (hsp == 0){
		sprite_index = character_default;
	} else {
		sprite_index = character_walk;
	}
}
if(hsp != 0) image_xscale = sign(hsp);
