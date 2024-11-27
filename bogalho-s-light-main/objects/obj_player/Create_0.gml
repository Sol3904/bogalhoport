/// @description Inicialização do jogador

event_inherited()

// Configurações iniciais
randomize();

// Inicialização explícita de state_names (array de estados)
state_names = ["idle", "moving", "jumping", "attacking", "dash", "hit", "dead"];
state_counts = array_create(array_length(state_names), 0); // Array para contagem de mudanças em cada estado

// Garantir que o estado inicial seja válido
state = "idle";
if (array_index(state_names, state) == -1) { 
    state = "idle"; // Define "idle" como padrão se o estado inicial for inválido
}

// Dados do jogador - inicialização explícita
player_data = {
    "states": [],           // Histórico de estados
    "change_count": 0,      // Contador de mudanças de estado
    "state_counts": []      // Inicializa como vazio (não usado diretamente)
};

// Carregar os dados do jogador de uma função externa (se existir)
load_player_data();

// Verificação de consistência de player_data após carregamento
if (!is_array(player_data.states)) {
    player_data.states = []; // Corrige se o histórico de estados não for carregado corretamente
}
if (is_undefined(player_data.change_count)) {
    player_data.change_count = 0; // Corrige se o contador de mudanças não for carregado corretamente
}

// Variáveis de controle de movimento
right = false;
left = false;
jump = false;
dash = false;
attack = false;

// Configuração de velocidades e limites
velh = 0;         // Velocidade horizontal inicial
velv = 0;         // Velocidade vertical inicial
max_velv = 10;    // Velocidade máxima vertical
max_velh = 4;     // Velocidade máxima horizontal
dash_vel = 7;     // Velocidade do dash

// Variáveis de ataque
combo = 0;        // Contador para combos
atk_buff = room_speed; // Buffer para ataque
atk_mult = 1;     // Multiplicador de ataque
dmg = noone;      // Nenhum objeto de dano inicial
possoatk = true;  // O jogador pode atacar inicialmente

// Configuração de vida e barra de vida
max_vida = 5;         // Vida máxima
vida_atual = max_vida; // Vida inicial
healthbar_width = 100; // Largura da barra de vida
healthbar_height = 10; // Altura da barra de vida

// Posição da barra de vida (ajustada para o jogador)
if (!variable_global_exists("initial_y")) {
    global.initial_y = y;
}
healthbar_x = (320 / 2) - (healthbar_width / 2);
healthbar_y = global.initial_y - 100;

// Inicialização de outras variáveis
xscale = 1;         // Escala horizontal inicial
show_state = true;  // Mostrar estado para depuração
state = "idle";     // Estado inicial definido como "idle"

// Depuração - Mensagem para validar inicialização
show_debug_message("Player criado com estado inicial: " + state);
