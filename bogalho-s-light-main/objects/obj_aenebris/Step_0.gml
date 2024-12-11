

// Verifica se o jogador existe e cria o objeto 'obj_aenebris' nas mesmas coordenadas do jogador
if (instance_exists(obj_player)) {
    if (!instance_exists(obj_aenebris)) {
        // Cria o 'obj_aenebris' nas coordenadas do 'obj_player'
        var aenebris = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_aenebris);
        //show_debug_message("obj_aenebris criado nas coordenadas do jogador.");
    } else {
        // Caso o 'obj_aenebris' já exista, atualiza sua posição para as do 'obj_player'
        with (obj_aenebris) {
            x = obj_player.x;
            y = obj_player.y;
        }
    }
}

// Verifica se player_data foi carregado corretamente
if (is_undefined(player_data) || !is_struct(player_data)) {
    show_debug_message("player_data não carregado corretamente, tentando carregar...");
    load_player_data();
}

// Garante que player_data.state_counts está correto
if (is_undefined(player_data.state_counts) || !is_array(player_data.state_counts)) {
    player_data.state_counts = array_create(7, 0);  // Inicializa com 7 contadores
}

// Verifica se state_counts tem pelo menos 7 elementos
if (is_array(player_data.state_counts) && array_length(player_data.state_counts) >= 7) {
    // Compara os contadores de estados para determinar o comportamento do inimigo
    if (player_data.state_counts[3] > player_data.state_counts[1]) {  // Atacando mais que correndo
        enemy_behavior = "defensive";
    } else if (player_data.state_counts[4] > player_data.state_counts[2]) {  // Usando dash mais que atacando
        enemy_behavior = "offensive";
    } 
} else {
    show_debug_message("Erro: state_counts inválido. Dados: " + string(player_data.state_counts));
    enemy_behavior = "normal";  // Comportamento padrão em caso de erro
}

// Define a velocidade inicial horizontal baseada no comportamento
switch (enemy_behavior) {
    case "defensive": 
        show_debug_message("state defensive") 
        break;
    case "offensive": 
        show_debug_message("state offensive")
        break;
    case "normal": 
        show_debug_message("state normal") 
        break;
}

// Movimentação e colisão
if (instance_exists(obj_block) && place_meeting(x + velh, y, obj_block)) {
    velh = 0;  // Impede movimento caso haja colisão com objeto 'obj_block'
}

move_contact_solid(velh, velv);  // Movimenta o inimigo respeitando colisões com objetos sólidos

// Proximidade com o jogador
if (instance_exists(obj_player) && distance_to_object(obj_player) < 100) {
    if (enemy_behavior == "offensive") {
        // Adicionar lógica de ataque
        // Aqui você pode adicionar a lógica do ataque, como aumentar o dano ou invocar um ataque específico
    }
}
