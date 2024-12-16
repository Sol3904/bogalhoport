/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _input = rollback_get_input();

if (_input.left)
{
        x -= 10;
}
if (_input.right)
{
        x += 10;
}
if (_input.down)
{
        y += 10;
}
if (_input.up)
{
        y -= 10;
}
direc = _input.right - _input.left
if(direc == -1)
{
	image_xscale = -1;
}
else if(direc == 1)
{
	image_xscale = 1;
}
//image_angle = point_direction(x, y, _input.mb_x, _input.mb_y);

if (_input.fire_pressed)
{
        var _proj = instance_create_layer(x, y, layer, obj_spell);
        
        _proj.speed = 10;
        _proj.direction = point_direction(x, y, _input.mb_x, _input.mb_y);
        _proj.image_angle = point_direction(x, y, _input.mb_x, _input.mb_y);
        _proj.player = self;
		
}