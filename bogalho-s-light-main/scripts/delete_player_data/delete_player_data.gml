// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function delete_player_data(){
	var caminho = working_directory + "player_data.json";
	if(file_exists(caminho))
	{
		file_delete(caminho)
	}
 show_message("Save Apagado.")
}