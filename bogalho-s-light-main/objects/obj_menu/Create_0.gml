/// @description Insert description here
// You can write your code in this editor

global.data_loaded = false; // Dados ainda não carregados


// Menu element names. This will be what is actually drawn
menu[0] = "Campaign";
menu[1] = "Multiplayer";
menu[2] = "Aenebris testing";
menu[3] = "Controls";
menu[4] = "Exit";


// cursorLevitate will be used to keep a variable that
// oscillates and moves the cursor back and forth
cursorLevitate = 0;


// cursorTime will be used as the "angle" of a sin function
// in conjunction with cursorlevitate to oscillate the cursor
cursorTime = 0;

// The rate at which the cursor oscillates. Higher value means faster
leviRate = 1.5;


// Holds what menu element is selected. Ex: if selected = 1, 
// then the selected element is Options.
selected = 0;
selectLerp = 0; // Same as previous line but for lerp (smooth movement)
lerpAmt = 0.2; // Higher number -> faster cursor (between 0 and 1)


// Spacing between each menu element when drawn
spacing = 16;


// Color of the menu element when selected
selectedCol = c_gray;

// Color of the menu element when not selected
notSelectedCol = c_black;

// Game title color
titleCol = c_white;


// Title of your game
gameTitle = "Bogalho's Light";

// Size of the title
titleSize = 1;


// Button to move up the menu
upButt = vk_up;

// Button to move down the menu
downButt = vk_down;

// Button to confirm menu choice
confirmButt = vk_enter;