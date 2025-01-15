/// @description Insert description here
// You can write your code in this editor

rollback_define_input(
{
        left: [vk_left,ord("A")],
        right: [vk_right,ord("D")],
        up: [vk_up,ord("W")],
        down: [vk_down,ord("S")],
        mb_x: m_axisx,
        mb_y: m_axisy,
        fire: mb_left
});

rollback_define_player(obj_isolde, "Instances");

if (!rollback_join_game())
{
        rollback_create_game(2, false);
}