function load_player_data() {
    var file_path = working_directory + "player_data.json";
    
    // Tenta abrir o arquivo para leitura
    if (!file_exists(file_path)) {
        show_debug_message("Arquivo de salvamento não encontrado. Usando valores padrão.");
        
        // Se o arquivo não for encontrado, inicialize com valores padrão
        player_data = {
            "change_count": 0,
            "state": {
                "x": 356, // Posição X padrão
                "y": 291, // Posição Y padrão
                "hp": 5   // HP padrão
            },
            "room": room // Adicionar a sala padrão como a sala atual
        };
        return;
    }

    var file = file_text_open_read(file_path);
    if (file == -1) {
        show_debug_message("Erro ao abrir o arquivo para leitura!");
        return;
    }

    // Lê o conteúdo do arquivo e converte para JSON
    var json_data = file_text_read_string(file);
    file_text_close(file);
    
    // Exibe o conteúdo lido do arquivo
    show_debug_message("Conteúdo do arquivo JSON: " + json_data);

    try {
        // Tenta interpretar o JSON
        var loaded_data = json_parse(json_data);

        // Verifica se o JSON foi carregado corretamente
        if (is_struct(loaded_data) && is_struct(loaded_data.state)) {
            show_debug_message("Estado carregado: x=" + string(loaded_data.state.x) + ", y=" + string(loaded_data.state.y) + ", hp=" + string(loaded_data.state.hp));
            
            player_data = loaded_data;
            
            // Atualiza as variáveis de estado com os valores carregados
            x = player_data.state.x != undefined ? player_data.state.x : 356;
            y = player_data.state.y != undefined ? player_data.state.y : 291;
            vida_atual = player_data.state.hp != undefined ? player_data.state.hp : 5;

          
        } else {
            throw new Error("Estrutura JSON inválida.");
        }
    } catch (e) {
        show_debug_message("Erro ao analisar JSON: " + string(e));
        
        // Se o JSON estiver incorreto, use valores padrão
        player_data = {
            "change_count": 0,
            "state": {
                "x": 356, // Posição X padrão
                "y": 291, // Posição Y padrão
                "hp": 5   // HP padrão
            },
            "room": room // Adicionar a sala padrão como a sala atual
        };
    }
}
