function save_player_data() {
    // Cria um objeto temporário como cópia de player_data
    var temp_data = player_data; // Usa uma referência direta (simples)
    
	nome_da_sala = "placeholder"
   

    if(room == Intro)
    {
	  nome_da_sala = "Intro"
	}
	
	if(room == Church)
    {
	  nome_da_sala = "Church"
	}
	
	if(room == Revive)
    {
	  nome_da_sala = "Revive"
	}
	
	if(room == Aenebris_testing)
	{
	  nome_da_sala = "Aenebris_testing"
	}
	
	if(room == Dungeon)
	{
		nome_da_sala = "Dungeon"
	}
	
	show_message(nome_da_sala)
	
	 // Adiciona o nome da sala ao objeto temporário
    temp_data.room = nome_da_sala;  // Salva a sala em que o jogador está
	
	
    // Converte o objeto temporário para uma string JSON
    var json_data = json_stringify(temp_data);
    show_debug_message("JSON gerado para salvar: " + json_data);

    // Salva os dados no arquivo
    var file_path = working_directory + "player_data.json";
    var file = file_text_open_write(file_path);
    if (file == -1) {
        show_debug_message("Erro ao abrir o arquivo para escrita!");
        return;
    }

    file_text_write_string(file, json_data);
    file_text_close(file);
}
