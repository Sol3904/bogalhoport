// Verifique se player_data já existe
if (!variable_global_exists("player_data")) {
    // Se não existir, inicialize player_data com valores padrão
    player_data = {
        "states": [],               // Array de estados do jogador
        "change_count": 0,          // Contador de mudanças de estado
        "state_counts": array_create(7, 0)  // Array de 7 contadores de estado
    };
    show_debug_message("player_data foi inicializada no Room Start.");
} else {
    show_debug_message("player_data já estava carregada.");
}

// Garantir que state_counts é um array válido com 7 elementos
if (!is_array(player_data.state_counts)) {
    player_data.state_counts = array_create(7, 0);  // Inicializa com 7 contadores
    show_debug_message("state_counts foi inicializado.");
}

// Verifique se player_data.state_counts tem ao menos 7 elementos
if (array_length(player_data.state_counts) < 7) {
    player_data.state_counts = array_create(7, 0);  // Garante que o array tenha 7 elementos
    show_debug_message("state_counts corrigido para ter 7 elementos.");
}

// Agora, inicialize qualquer outro dado ou lógica relacionada ao jogador
show_debug_message("player_data inicializada corretamente.");
