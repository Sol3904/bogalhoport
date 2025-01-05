/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//estou a colidir com o player?
var player = place_meeting(x,y,obj_player);

//espaco
var espaco = keyboard_check_released(ord("E"));

//esta
if(player && espaco)
{
	room_goto(Church)
}