/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if (other.player == self) exit;

effect_create_above(ef_ring, x, y, 0, c_white);
        
x = irandom_range(40, room_width - 40);

y = irandom_range(40, room_height - 40);
        
instance_destroy(other);

other.player.points ++;