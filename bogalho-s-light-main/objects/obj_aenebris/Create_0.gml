event_inherited()

// Inicializa as variáveis de velocidade
velh = 0;  // Velocidade horizontal (inicializada no Create)
velv = 0;  // Velocidade vertical (inicializada no Create)

// Garantir que o objeto esteja visível
visible = true;
//show_debug_message("obj_aenebris Create event started.");

// Limitar a posição dentro dos limites da sala
x = clamp(x, 0, room_width);  // Ajusta a posição X dentro dos limites
y = clamp(y, 0, room_height);  // Ajusta a posição Y dentro dos limites

// Inicializa as variáveis locais
enemy_behavior = "normal";  // Valor padrão para evitar acesso a variáveis indefinidas

// Mensagens de depuração
//show_debug_message("Inicializando obj_aenebris");
//show_message("Comportamento inicial do inimigo: " + string(enemy_behavior));

// Definir limites de comportamento
attack_threshold = 5.0;  
dash_threshold = 5.0;

// Limites de patrulha e movimento
left_bound = 100;   
right_bound = 500;  

// Limita a velocidade para evitar movimento rápido
velh = clamp(velh, -2, 2);  // Reduz a velocidade horizontal para um intervalo seguro

// Flags de colisão e movimento
can_move = true;

// Mensagens de depuração
//show_debug_message("obj_aenebris posição - X: " + string(x) + ", Y: " + string(y));


