#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
void start();
void game();
void win();
void lose();
void goToStart();
void goToGame();
void goToWin();
void goToLose();
// States
enum {START, GAME, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    goToStart();

}

void start() {
    seed++;
    if(BUTTON_PRESSED(BUTTON_START)){
        goToGame();
        srand(seed);
        initGame();
    }
}
void goToStart() {
    fillScreen(CYAN);
    state = START;
}
void game() {
    updateGame();
    waitForVBlank();
    drawGame();
    if(!(bricksRemaining)){
        goToWin();
    }
    if(!(bulletOOB)){
        goToLose();
    }
}
void goToGame() {
    fillScreen(BLACK);
    state = GAME;
}
void win() {
    if(BUTTON_PRESSED(BUTTON_START)){
        goToStart();
    }
}
void goToWin() {
    fillScreen(GREEN);
    state = WIN;
}
void lose() {
    if(BUTTON_PRESSED(BUTTON_START)){
        go = 0;
        goToStart();
    }
}
void goToLose() {
    fillScreen(BLACK);
    drawRect(35, 80, 85, 30, RED);
    drawRect(100, 110, 20, 40, RED);
    state = LOSE;
}