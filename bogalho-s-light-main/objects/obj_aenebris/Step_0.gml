// Verifica se player_data foi carregado corretamente
if (is_undefined(player_data)) {
    load_player_data();  // Tenta carregar os dados se não estiverem carregados
}

// Garante que player_data.state_counts está correto
if (is_array(player_data.state_counts) && array_length(player_data.state_counts) >= 7) {
    // Determina o comportamento do inimigo com base nos estados do jogador
    if (player_data.state_counts[3] > player_data.state_counts[1]) {
        // Comportamento defensivo se o jogador atacou mais
        enemy_behavior = "defensive";
    } else if (player_data.state_counts[4] > player_data.state_counts[2]) {
        // Comportamento ofensivo se o jogador usou mais o "dash"
        enemy_behavior = "offensive";
    } else {
        // Comportamento padrão (neutro) caso o jogador não tenha se concentrado em nenhum dos dois
        enemy_behavior = "normal";
    }
} else {
    // Caso state_counts não tenha sido configurado corretamente, o inimigo terá comportamento padrão
    show_debug_message("Erro: player_data ou state_counts não está configurado corretamente.");
    enemy_behavior = "normal";  // Comportamento padrão
}

// Comportamento do inimigo (movimento e colisão)
switch (enemy_behavior) {
    case "defensive":
        // Comportamento defensivo: move-se de forma cautelosa, não se aproxima demais do jogador
        hspd = 0;  // Inimigo não se move ofensivamente
        vspd = 0;  // Inimigo fica parado em sua posição
        break;

    case "offensive":
        // Comportamento ofensivo: move-se em direção ao jogador
        var player_distance = player.x - x; // Calcula a distância do jogador
        if (player_distance > 0) {
            hspd = 4;  // Move-se para a direita
        } else {
            hspd = -4;  // Move-se para a esquerda
        }
        vspd = 0;  // Sem movimento vertical
        break;

    case "normal":
        // Comportamento padrão: patrulha normalmente (sem agir de forma ofensiva ou defensiva)
        hspd = 2;  // Movimenta-se em uma velocidade padrão
        vspd = 0;  // Sem movimento vertical
        break;
}

// Movimentação do inimigo: Verifica colisão com parede
if (place_meeting(x + hspd, y, obj_block)) {
    hspd = 0;  // Para o movimento horizontal se houver colisão com a parede
}

// Aplica a movimentação do inimigo
move_contact_solid(hspd, vspd);

// Detecta se o inimigo está perto do jogador (exemplo de uma interação ou proximidade)
if (distance_to_object(obj_player) < 100) {
    // O inimigo pode começar a atacar ou seguir o jogador se estiver muito próximo
    // Aqui você pode adicionar comportamento adicional, como um ataque ou ação especial
    if (enemy_behavior == "offensive") {
        // Atacar ou agir de forma agressiva
        // Exemplo: Iniciar animação de ataque ou fazer o inimigo causar dano ao jogador
    }
}
