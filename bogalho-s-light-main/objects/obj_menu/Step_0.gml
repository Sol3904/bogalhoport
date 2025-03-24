/// @description Insert description here
// You can write your code in this editor

// Oscillate the cursor using sin function
cursorLevitate = dsin(cursorTime);

// Use this as an "angle" to use in the sin function
// to oscillate cursor
cursorTime += leviRate;


// Vertical input is determined by the press of up
// and down buttons
var vert =  keyboard_check_pressed(downButt) -  keyboard_check_pressed(upButt);

// Move cursor up or down depending on inputs
selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt); // Smooth cursor movement

// Don't let cursor move past where it should be
selected = clamp(selected, 0, array_length_1d(menu) - 1);

// Whenever you press the confirm button, do whatever
// it should do depending on what menu element is selected
if(keyboard_check_pressed(confirmButt))
{
	if(selected == 0) //Campaign
	{
		load_player_data()
		if(player_data.room == "Church")
			{
			   room_goto(Church)
			}
		
		if(player_data.room == "Intro")
			{
			   room_goto(Intro)
			}
		if(player_data.room == "Placeholder")
		{
		   room_goto(Aenebris_testing)
		}
		else
		{
			room_goto(Intro)
		}
	}
	
	if(selected == 1) // Multi
	{
		room_goto(Multiplayer)
	}
	
	if(selected == 2) // Options
	{
		room_goto(Dungeon)
	}
	
	if(selected == 3)
	{
	   show_message("WASD para Mover\nJ para Atacar\nK para deslizar\nEspaço para saltar\nY para salvar\nR para Reiniciar a sala\nM para apagar o save");

	}
	
	if(selected == 4) // Exit by default
	{
		game_end();
	}
}