function load_player_data() {
    show_debug_message("Função load_player_data chamada");

    // Inicializa player_data com valores padrão, caso ainda não tenha sido inicializado
    if (is_undefined(player_data)) {
        player_data = {
            "states": [],
            "change_count": 0,
            "state_counts": array_create(7, 0)  // Inicializa com 7 contadores (correspondendo aos 7 estados)
        };
    }

    // Verifica se o arquivo existe
    if (file_exists("player_data.json")) {
        var file = file_text_open_read("player_data.json");
        var json_string = file_text_read_string(file);
        file_text_close(file);

        var loaded_data = json_decode(json_string);

        // Verifica se a estrutura carregada é válida
        if (is_struct(loaded_data)) {
            // Sobrescreve os campos existentes nos dados carregados

            // Carrega states (histórico de estados)
            if (is_array(loaded_data.states)) {
                player_data.states = loaded_data.states;
            }

            // Carrega o contador de mudanças (garante que seja inteiro)
            if (!is_undefined(loaded_data.change_count)) {
                player_data.change_count = int(loaded_data.change_count);
            }

            // Carrega os contadores de estado, garantindo que o array tenha pelo menos 7 elementos (um para cada estado)
            if (is_array(loaded_data.state_counts)) {
                for (var i = 0; i < array_length(player_data.state_counts); i++) {
                    // Converte para inteiro os valores de state_counts, pois o JSON os carrega como flutuantes
                    player_data.state_counts[i] = int(loaded_data.state_counts[i]);
                }
            } else {
                // Se a estrutura "state_counts" não estiver correta, inicializa com valores padrão
                player_data.state_counts = array_create(7, 0);  // Garante que tenhamos 7 contadores
            }
        } else {
            show_debug_message("Erro: O arquivo JSON não contém uma estrutura válida.");
        }
    } else {
        // Se o arquivo não for encontrado, use valores padrão
        show_debug_message("Arquivo player_data.json não encontrado. Usando valores padrão.");
        player_data = {
            "states": [],
            "change_count": 0,
            "state_counts": array_create(7, 0)  // Inicializa com 7 contadores (correspondendo aos 7 estados)
        };
    }

    // Depois de carregar ou inicializar, verifica se a estrutura está válida
    show_debug_message("player_data carregado: " + string(player_data));
}
