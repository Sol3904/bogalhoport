event_inherited(); // Garante que as variáveis do obj_entity sejam inicializadas

// Ajuste de atributos herdados
max_vida = 10;      // Redefine a vida máxima para este tipo de inimigo
vida_atual = max_vida; // Inicializa a vida atual com o valor máximo

max_velh = 2;       // Redefine a velocidade horizontal máxima para o inimigo
max_velv = 3;       // Redefine a velocidade vertical máxima (se aplicável)
massa = 2;          // Define a massa do inimigo para cálculos de física
ataque = 5;         // Ajusta o dano causado pelo inimigo
state = "idle";     // Garante que o estado inicial é ocioso

// Variáveis específicas do obj_aenebris
reaction_delay = 0; // Delay de reação inicial
can_react = true;   // Se o inimigo pode reagir imediatamente
enemy_behavior = "idle"; // Define um comportamento padrão para complementar o estado

// Configurações de patrulha
left_bound = 100;       // Limite esquerdo de patrulha
right_bound = 500;      // Limite direito de patrulha
patrol_speed = 1;       // Velocidade ao patrulhar

// Configurações de ataque
attack_range = 50;      // Distância mínima para iniciar um ataque
vision_range = 300;     // Alcance de visão do inimigo
attack_cooldown = room_speed; // Tempo entre ataques
attack_timer = 0;       // Inicializa o contador de ataque

// Esquiva e comportamento
evade_range = 40;       // Distância mínima para esquivar
follow_speed = 2;       // Velocidade ao seguir o jogador
evade_speed = 5;        // Velocidade ao esquivar

// Referência ao jogador
target_player = obj_player; // Define o jogador como alvo do inimigo

// Configurações de movimento
velh = clamp(velh, -max_velh, max_velh); // Garante que a velocidade inicial esteja dentro do limite
can_move = true;          // Flag para controle de movimento

// Alarmes
alarm[0] = -1;  // Configura o alarme para atrasar ações ou reações
