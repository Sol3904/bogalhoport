// Inicialização do jogador com `x`, `y`, e `hp` em variáveis de estado

event_inherited();

// Configurações iniciais
randomize();

// Inicialização explícita de player_attributes (atributos do jogador)
player_attributes = ["x", "y", "hp"]; // Atributos monitorados
player_state = {
    x: 356,                      // Posição X inicial (alterado para 356)
    y: 291,                      // Posição Y inicial (alterado para 291)
    hp: vida_atual               // Vida inicial
};

// Dados do jogador - inicialização explícita para salvar/carregar
player_data = {
    state: player_state,         // Estado inicial do jogador
    change_count: 0              // Contador de mudanças no estado (se necessário)
};

// Carregar os dados do jogador de um arquivo JSON (se existir)
load_player_data();

// Atualizar variáveis locais a partir de player_data após o carregamento
if (is_struct(player_data.state)) {
    player_state = player_data.state; // Sincroniza os estados carregados
    x = player_state.x;              // Use a notação de ponto para acessar 'x'
    y = player_state.y;              // Use a notação de ponto para acessar 'y'
    vida_atual = player_state.hp;    // Use a notação de ponto para acessar 'hp'
} else {
    // Corrige valores caso o JSON não esteja completo
    player_state = {
        x: 356,    // Posição X padrão (356)
        y: 291,    // Posição Y padrão (291)
        hp: vida_atual
    };
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

// Depuração - Mensagem para validar inicialização
show_debug_message("Player criado com posição inicial: (" + string(x) + ", " + string(y) + ") e HP: " + string(vida_atual));
