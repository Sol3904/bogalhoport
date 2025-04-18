/// @description Health bar
// Você pode escrever seu código neste editor

// desenhar a barra de vida no ecra
draw_sprite_stretched(spr_healthbar,0,healthbar_x,healthbar_y,(vida_atual/max_vida) * healthbar_width, healthbar_height);