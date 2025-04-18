/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//if (sprite_index == spr_priestkill)
//{
   // image_speed = 0;
    //image_index = image_number - 1; // Ensure it stays on the last frame
//}

//impedir que a animacao se repita
if(state = "dead")
{
image_speed = 0;
    image_index = image_number - 1; // Ensure it stays on the last frame
}