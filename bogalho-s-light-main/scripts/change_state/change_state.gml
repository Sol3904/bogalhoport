function change_state(new_state) {
    if (state != new_state) {
        // Atualiza o estado do jogador
        state = new_state;

        // Incrementa o contador geral de mudanças no estado
        player_data.change_count += 1;

        // Exibe mensagem de depuração sobre a mudança
        show_debug_message("Estado alterado para: " + new_state);

        // Salva os dados do jogador
        save_player_data();
    }
}
