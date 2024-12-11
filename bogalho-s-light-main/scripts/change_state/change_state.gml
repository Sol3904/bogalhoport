// Função para mudar de estado
function change_state(new_state) {
    //show_debug_message("Função change_state chamada com o novo estado: " + new_state);


    if (state != new_state) {
        state = new_state;

        // Adiciona o estado ao histórico de mudanças
        array_push(player_data.states, state);

        // Incrementa o contador geral de mudanças
        player_data.change_count += 1;

        // Encontra o índice do estado
        var state_index = array_index(state_names, new_state);
        if (state_index == -1) {
            show_error("Estado '" + new_state + "' não encontrado em state_names.", true);
        } else {
            // Incrementa o contador do estado específico
            state_counts[state_index] += 1;
        }

        // Salva os dados do jogador
        save_player_data();
    }
}
