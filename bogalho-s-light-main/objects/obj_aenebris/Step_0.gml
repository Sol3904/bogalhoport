event_inherited(); // Herda comportamento do obj_entity, se necessário

// Variáveis auxiliares
var player_x = target_player.x;
var player_y = target_player.y;
var distance_to_player = point_distance(x, y, player_x, player_y);

// Verifica se o inimigo está no chão
var chao = place_meeting(x, y + 1, obj_block);

// Gravidade
if (!chao) {
    velv += GRAVIDADE * massa; // Acelera verticalmente devido à gravidade
    velv = clamp(velv, -max_velv, max_velv); // Limita a velocidade vertical
} else {
    velv = 0; // Reseta a velocidade vertical ao tocar o chão
}

// Aplica a velocidade vertical
y += velv;

// Verifica se o jogador está dentro do alcance de visão
if (distance_to_player <= vision_range) {
    // Ajustar direção para olhar para o jogador
    if (player_x > x) {
        image_xscale = 1;
    } else {
        image_xscale = -1;
    }

    // Lógica de ataque
    if (distance_to_player <= attack_range && attack_timer <= 0) {
        // Inicia o ataque
        state = "attacking";
        attack_timer = attack_cooldown; // Reseta o cooldown
    } 
    else if (distance_to_player > attack_range && can_move) {
        // Seguir o jogador se estiver fora do alcance de ataque
        state = "following";
        velh = follow_speed * sign(player_x - x);
    }
} else {
    // Patrulha se o jogador não está na visão
    state = "patrolling";
    if (x <= left_bound) {
        velh = patrol_speed; // Move para a direita
    } else if (x >= right_bound) {
        velh = -patrol_speed; // Move para a esquerda
    }
}

// Restringe a velocidade horizontal
velh = clamp(velh, -max_velh, max_velh);
x += velh;

// Reduz o cooldown de ataque
if (attack_timer > 0) {
    attack_timer -= 1;
}

// Transições de estado
switch (state) {
    case "attacking": {
        // Configuração de sprite de ataque
        //sprite_index = spr_enemy_attack;
        show_debug_message("Case attacking");

        // Lógica de dano
        if (image_index == 2 && !dano_causado) { // Supondo que o ataque cause dano no frame 2
            with (instance_create_layer(x + image_xscale * 100, y, layer, obj_dmg)) {
				ataque = 5;
                dmg = ataque
                pai = other; // Define quem causou o dano
            }
            dano_causado = true;
        }

        // Voltar ao estado idle após o ataque
        if (image_index >= image_number - 1) {
            state = "idle";
            dano_causado = false;
        }
        break;
    }

    case "following": {
        // Configuração de sprite de movimento
        //sprite_index = spr_enemy_walk;
        show_debug_message("Case following");

        // Parar movimento horizontal se houver colisão com o jogador
        if (place_meeting(x + velh, y, target_player)) {
            velh = 0;
            state = "idle"; // Transiciona para o estado idle ou outro estado apropriado
        }
        break;
    }

    case "patrolling": {
        // Configuração de sprite de patrulha
        //sprite_index = spr_enemy_walk;
        show_debug_message("Case patrolling");
        break;
    }

    case "idle": {
        // Configuração de sprite idle
        //sprite_index = spr_enemy_idle;
        show_debug_message("Case idle");
        velh = 0;
        velv = 0;
        break;
    }
}
