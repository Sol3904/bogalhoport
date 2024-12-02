event_inherited();

// Inicializa o comportamento do inimigo
attack_threshold = 5.0;  // Definição de limite para o estado "attacking"
dash_threshold = 5.0;    // Definiçã o de limite para o estado "dash"

// Configurações iniciais do inimigo
left_bound = 100;   // Posição x mínima da patrulha
right_bound = 500;  // Posição x máxima da patrulha
hspd = 0;           // Velocidade horizontal do inimigo

// Variáveis de colisão
can_move = true; // Variável para checar se o inimigo está livre para se mover

// Cria o player_data com valores padrão se ainda não estiver inicializado
load_player_data();

// Verifica se player_data está devidamente carregado
if (is_undefined(player_data) || !is_struct(player_data)) {
    show_debug_message("Erro: player_data não foi carregado corretamente!");
    // Caso não tenha carregado corretamente, inicialize com valores padrões
    player_data = {
        "states": [],
        "change_count": 0,
        "state_counts": array_create(7, 0)  // Inicializa com 7 contadores (correspondendo aos 7 estados)
    };
}

// Verifica se player_data está válido após o carregamento
if (is_undefined(player_data) || !is_struct(player_data) || !is_array(player_data.state_counts)) {
    show_debug_message("Erro crítico: player_data não foi carregado corretamente.");
    // Comportamento padrão caso player_data esteja corrompido
    enemy_behavior = "normal";
} else {
    // Verifica se o array "state_counts" tem pelo menos 7 elementos
    if (array_length(player_data.state_counts) >= 7) {
        var attacking_count = player_data.state_counts[3];  // Contador do estado "attacking"
        var dash_count = player_data.state_counts[4];       // Contador do estado "dash"

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
        // Caso o array "state_counts" não tenha pelo menos 7 elementos
        show_debug_message("Warning: state_counts array does not contain enough elements.");
        enemy_behavior = "normal";  // Comportamento padrão
    }
}

// Garantir que o inimigo tenha um comportamento inicial (normal)
if (enemy_behavior == undefined) 
{
    enemy_behavior = "normal";
}

// Comportamento do inimigo
switch (enemy_behavior) {
    case "defensive":
        hspd = 0; vspd = 0; break;

    case "offensive":
        var player_distance = instance_exists(obj_player) ? (player.x - x) : 0;
        hspd = player_distance > 0 ? 4 : -4;
        vspd = 0; break;

    case "normal":
        hspd = 2; vspd = 0; break;
}

// Movimentação e colisão
if (instance_exists(obj_block) && place_meeting(x + hspd, y, obj_block)) {
    hspd = 0;
}

move_contact_solid(hspd, vspd);

// Proximidade com o jogador
if (instance_exists(obj_player) && distance_to_object(obj_player) < 100) {
    if (enemy_behavior == "offensive") {
        // Adicionar lógica de ataque
    }
}
