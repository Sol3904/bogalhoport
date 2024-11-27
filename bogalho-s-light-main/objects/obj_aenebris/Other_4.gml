// Verifica se player_data está corretamente carregado
if (is_undefined(player_data)) {
    load_player_data();  // Carrega os dados se ainda não estiverem carregados
}

// Inicializa o comportamento do inimigo como padrão
enemy_behavior = "normal";  // Comportamento inicial padrão
