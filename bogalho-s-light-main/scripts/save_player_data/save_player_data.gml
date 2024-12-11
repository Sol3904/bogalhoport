function save_player_data() {
    //show_debug_message("Função save_player_data chamada");

    // Cria um objeto temporário como cópia de player_data
    var temp_data = player_data; // Usa uma referência direta (simples)

    // Adiciona os contadores de estado ao objeto temporário
    temp_data.state_counts = state_counts;

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

    //show_debug_message("Arquivo salvo com sucesso em: " + file_path);
}
