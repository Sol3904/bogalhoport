event_inherited()

// Inicializa o comportamento do inimigo
player_data = undefined;
attack_threshold = 5.0;  // Definição de limite para o estado "attacking"
dash_threshold = 5.0;    // Definição de limite para o estado "dash"

// Configurações iniciais do inimigo
left_bound = 100;   // Posição x mínima da patrulha
right_bound = 500;  // Posição x máxima da patrulha
hspd = 0;           // Velocidade horizontal do inimigo

// Variáveis de colisão
can_move = true; // Variável para checar se o inimigo está livre para se mover

// Lê o arquivo player_data.json
if (file_exists("player_data.json")) {
    // Abre o arquivo e lê o conteúdo como uma string
    var json_string = "";
    var file_id = file_text_open_read("player_data.json");
    
    while (!file_text_eof(file_id)) {
        json_string += file_text_read_string(file_id);
        file_text_readln(file_id);  // Pula para a próxima linha (se necessário)
    }
    
    file_text_close(file_id);
    
    // Tenta decodificar o JSON
    player_data = json_decode(json_string);
    
    // Verifica se player_data foi carregado corretamente
    if (is_struct(player_data)) {
        // Verifica se o campo "state_counts" existe dentro de player_data
        if (variable_struct_exists(player_data, "state_counts")) {
            var state_counts = player_data.state_counts;
            
            // Verifica se state_counts é um array válido
            if (is_array(state_counts)) {
                // Verifica o tamanho do array para garantir que contém pelo menos 7 elementos
                if (array_length(state_counts) >= 7) {
                    var attacking_count = state_counts[3];  // Contador do estado "attacking"
                    var dash_count = state_counts[4];       // Contador do estado "dash"
                    
                    // Altera o comportamento do inimigo com base nos dados do player
                    if (attacking_count > dash_count && attacking_count > attack_threshold) {
                        // Comportamento defensivo: Jogador está atacando mais
                        enemy_behavior = "defensive";
                    } else if (dash_count > attacking_count && dash_count > dash_threshold) {
                        // Comportamento ofensivo: Jogador está usando o dash mais
                        enemy_behavior = "offensive";
                    } else {
                        // Comportamento normal
                        enemy_behavior = "normal";
                    }
                } else {
                    // Caso o array não tenha pelo menos 7 elementos
                    enemy_behavior = "normal";
                    show_debug_message("Warning: state_counts array does not contain enough elements.");
                }
            } else {
                // Caso state_counts não seja um array válido
                enemy_behavior = "normal";
                show_debug_message("Warning: state_counts is not a valid array.");
            }
        } else {
            // Caso player_data não contenha state_counts
            enemy_behavior = "normal";
            show_debug_message("Warning: player_data does not contain state_counts.");
        }
    } else {
        // Caso player_data não tenha sido carregado corretamente
        enemy_behavior = "normal";
        show_debug_message("Warning: Failed to decode player_data JSON.");
    }
} else {
    // Caso o arquivo não exista, define o comportamento padrão
    enemy_behavior = "normal";
    show_debug_message("Warning: player_data.json not found.");
}
