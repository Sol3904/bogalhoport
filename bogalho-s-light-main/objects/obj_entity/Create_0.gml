/// este é o objeto base de todos os objetos do jogo
max_vida = 1;
vida_atual = max_vida;

velh = 0;
velv = 0;

max_velh = 1;
max_velv = 1;

massa = 1;
ataque = 1;

show_state = false;

if (room_speed > 0) {
    img_spd = 50 / room_speed;
}

state = "idle";
