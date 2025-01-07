function save_player_data() {
    // Criar uma cópia de player_data
    var temp_data = {
        "change_count": player_data.change_count,
        "state": {
            "x": player_data.state.x,
            "y": player_data.state.y,
            "hp": player_data.state.hp
        }
    };

    // Verifique se os dados de estado estão completos
    if (!is_struct(temp_data.state)) {
        show_debug_message("Erro: Dados de estado incompletos!");
        return;
    }

    // Converte o objeto para JSON
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

    show_debug_message("Arquivo salvo com sucesso em: " + file_path);
}
