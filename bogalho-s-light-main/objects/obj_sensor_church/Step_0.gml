/// @description Transição de sala com salvamento do estado do jogador

// Verificar se o jogador está na sala atual
var player = instance_find(obj_player, 0);  // 0 encontra a primeira instância de obj_player

// Se o jogador não foi encontrado, não faça nada
if (player == noone) {
    show_debug_message("Erro: Instância do jogador não encontrada na sala atual.");
    return;  // Sai da execução sem fazer mais nada
}

// Verificar se a tecla "E" foi liberada
var espaco = keyboard_check_released(ord("E"));

// Se o jogador está na sala e pressionou a tecla "E", faz a transição de sala
if (espaco) {
    // Fazer a transição para a nova sala
    room_goto(Church);  
} else {
    show_debug_message("Esperando para salvar e transitar de sala.");
}
