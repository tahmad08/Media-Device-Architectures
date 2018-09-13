#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
void start();
void game();
void pause();
void win();
void lose();
void goToStart();
void goToGame();
void goToPause();
void goToWin();
void goToLose();
// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

char buffer[41];

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
            case PAUSE:
                pause();
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

void goToStart() {
    fillScreen(REDORANGE);

    drawString(80, 60, "WELCOME to Breakout", BLACK);
    drawString(89, 60, "To play, hit start.", BLACK);

    state = START;
    seed = 0;
}

void start() {
    seed++;
    waitForVBlank();
    if(BUTTON_PRESSED(BUTTON_START)){
        srand(seed);

        goToGame();

        initGame();
    }
}

void goToGame() {
    fillScreen(BLACK);

    drawString(150, 1, "Bricks Remaining: ", WHITE);

    state = GAME;

}

void game() {
    updateGame();

    sprintf(buffer, "%d", bricksRemaining);

    waitForVBlank();
    drawGame();

    drawRect(150, 107, 8, 6, BLACK);
    drawRect(150, 113, 8, 6, BLACK);
    drawString(150, 107, buffer, WHITE);

    if(!(bricksRemaining)){
        goToWin();
    }
    if(!(ballOOB)){
        goToLose();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

}

void goToPause() {

    fillScreen(LIGHTBLUE);

    sprintf(buffer, "%d", bricksRemaining);

    drawString(70, 100, "Pause", WHITE);

    drawString(80, 40, "Bricks remaining in game: ", WHITE);

    drawRect(80, 196, 8, 6, LIGHTBLUE);
    drawRect(80, 202, 8, 6, LIGHTBLUE);
    drawString(80, 196, buffer, WHITE);

    drawString(90, 60, "To resume, hit start", WHITE);


    state = PAUSE;
}


void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToWin() {
    fillScreen(LIGHTGREEN);

    drawString(80, 100, "YOU WON!", WHITE);
    drawString(89, 40, "To play again, hit start.", WHITE);

    state = WIN;
}

void win() {
    waitForVBlank();

    if(BUTTON_PRESSED(BUTTON_START)){
        goToStart();
    }
}

void goToLose() {
    fillScreen(BLACK);

    drawString(80, 70, "YOU LOST! wild.", WHITE);
    drawString(89, 40, "To play again, hit start.", WHITE);

    state = LOSE;
}

void lose() {

    waitForVBlank();

    if(BUTTON_PRESSED(BUTTON_START)){
        go = 0;
        goToStart();
    }
}
