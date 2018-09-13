/* 
--Done: Player movement and hitting an enemy, my backgrounds, Losing, Lives, Enemy sprites, BG1 + BG2, all states
scoring

--To Do: bullet cheats (and update all the art). Also colliding with 
the sides of the BG2 should cause you to lose a life but my BG2 is messed up so i removed it. and regulate
enemies coming in, and their speeds

--Maybe To Do: I might add an enemy3 if I have time and I want to change the speed of enemy 2 to be faster
OR change it to get faster later on in the game. Prob will use a collision map for hitting the sides of the BG2 
instead of limited layer movement
Also I want to change my sprite sizes to be bigger and control the number of enemies coming and going

--How to Play: just move the player around and avoid the incoming aliens, can shoot to kill them with A. Some require more
bullets than others. After a certain period, more 
enemies will start to appear and they will require TWO bullets to kill instead of one. You have 4 lives. No win state.
*/
//I want to use timers to spawn the enemies but I'm not really sure how to yet, so i ended up using frame counting
//need to fix the sound from strting over when you return to game from PAUSE
#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "startscrn.h"
#include "instrscrn.h"
#include "pausescrn.h"
#include "gamescrn.h"
#include "topScrn.h"
#include "losescrn.h"
#include "winscrn.h"
#include "spritesht.h"
#include "sound.h"
#include "Lorn.h"
#include "gameSong.h"
#include "shoot.h"
#include "bgo.h"
#include "collision.h"
#include "text.h"
#include "font.h"

//Prototypes
void initialize();
void goToStart();
void start();
void goToInstr();
void instr();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void goToGame();
void game();

//vertical and horizontal offsets
int hOff = 0;
int vOff = 0;
int arr[35];
int pauseToGame;
//Sound stuff
SOUND soundA;
SOUND soundB;

// States for game
void (*state)();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

//characters
char buffer[41];

int main() {
    hideSprites();
    setupSounds();
    setupInterrupts();
    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;


        // State Machine
        state();

    }

    return 0;
}

void initialize() {
    //load the sprites
    DMANow(3, spriteshtPal, SPRITEPALETTE, spriteshtPalLen/2);
    DMANow(3, spriteshtTiles, &CHARBLOCK[4], spriteshtTilesLen/2);

    //hide em
    hideSprites();
    pauseToGame = 0;
    //enable mode 0, background 0, and the sprites
    //IF YOU WANT YOUR GAME STATES TO NOT HAVE THE SPRITES, MOVE SPRITE_ENABLE ELSEWHERE
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    initGame();

    buttons = BUTTONS;
    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {
    //Waits for vertical blank and flips the page
    waitForVBlank();
    flipPage();


    state = start;
    // stopSound();

    playSoundA(Lorn,LORNLEN,LORNFREQ, 1);

    // Begin the seed randomization
    seed = 0;
}

// Runs every frame of the start state
void start() {
    //load the start screen into DMA
    DMANow(3, startscrnPal, PALETTE, startscrnPalLen/2);
    DMANow(3, startscrnTiles, &CHARBLOCK[0], startscrnTilesLen/2);
    DMANow(3, startscrnMap, &SCREENBLOCK[28], startscrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        REG_DISPCTL = SPRITE_ENABLE;

        // Seed the random generator
        srand(seed);

        goToGame();
        // initGame();
    }

    if(BUTTON_PRESSED(BUTTON_SELECT)){
        goToInstr();
    }
}

// Sets up the instructions state
void goToInstr() {
    waitForVBlank();
    flipPage();
    state = instr;
    // stopSound();

}
void instr() {

    hideSprites();

    //load the win screen into DMA
    DMANow(3, instrscrnPal, PALETTE, instrscrnPalLen/2);
    DMANow(3, instrscrnTiles, &CHARBLOCK[0], instrscrnTilesLen/2);
    DMANow(3, instrscrnMap, &SCREENBLOCK[28], instrscrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}
// Sets up the game state
void goToGame() {
    // load the game screen into DMA

    REG_DISPCTL = MODE0 | BG2_ENABLE | SPRITE_ENABLE;
    REG_DISPCTL |= BG1_ENABLE;
    REG_DISPCTL |= BG0_ENABLE;
    DMANow(3, topScrnPal, PALETTE, topScrnPalLen/2);
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(25) | BG_8BPP | BG_SIZE_TALL;
    DMANow(3, gamescrnTiles, &CHARBLOCK[0], gamescrnTilesLen/2);
    DMANow(3, gamescrnMap, &SCREENBLOCK[25], gamescrnMapLen/2);

    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
    DMANow(3, topScrnTiles, &CHARBLOCK[1], topScrnTilesLen/2);
    DMANow(3, topScrnMap, &SCREENBLOCK[28], topScrnMapLen/2);

    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(31) | BG_8BPP | BG_SIZE_SMALL;
    DMANow(3, bgoTiles, &CHARBLOCK[2], bgoTilesLen/2);
    DMANow(3, bgoMap, &SCREENBLOCK[31], bgoMapLen/2);

    if (!pauseToGame) {
        stopSound();
        playSoundA(gameSong,GAMESONGLEN,GAMESONGFREQ, 1);
    }
    state = game;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();

    //Copy the shadowOAM into the OAM
    DMANow(3, shadowOAM, OAM, 128*4);
    flipPage();

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    } else if (livesLeft < 1) {
        goToLose();
    } 
    vOff--;
    REG_BG2VOFF = vOff*2;
    REG_BG1VOFF = vOff/2;


}

// Sets up the pause state
void goToPause() {
    waitForVBlank();
    flipPage();
    state = pause;
    // stopSound();
}

// Runs every frame of the pause state
void pause() {
    //load the pause screen into DMA
    hideSprites();
    DMANow(3, pausescrnPal, PALETTE, pausescrnPalLen/2);
    DMANow(3, pausescrnTiles, &CHARBLOCK[0], pausescrnTilesLen/2);
    DMANow(3, pausescrnMap, &SCREENBLOCK[28], pausescrnMapLen/2);
    // Set up Background 0
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG0_ENABLE;


    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)){
        REG_DISPCTL = SPRITE_ENABLE;
        pauseToGame = 1;
        goToGame();

    } else if (BUTTON_PRESSED(BUTTON_SELECT)){
            pauseToGame = 0;
            main();
        }
}

// Sets up the win state

void goToWin() {

    //Wait for vertical blank and flip the page
    waitForVBlank();
    flipPage();
    state = win;
}

// Runs every frame of the win state
void win() {

    hideSprites();

    //load the win screen into DMA
    DMANow(3, winscrnPal, PALETTE, winscrnPalLen/2);
    DMANow(3, winscrnTiles, &CHARBLOCK[0], winscrnTilesLen/2);
    DMANow(3, winscrnMap, &SCREENBLOCK[28], winscrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        main();
}

// Sets up the lose state
void goToLose() {
    flipPage();
    hideSprites();
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    fillScreen3(BLACK);
    sprintf(buffer, "Score: %d", score);

    drawString3(40, 90, "GAME OVER!", WHITE);

    drawString3(50, 90, buffer, WHITE);
    drawString3(60, 85, "Press START to", WHITE);
    drawString3(70, 85, "return to menu", WHITE);
    state = lose;
    // stopSound();
    flipPage();
    fillScreen3(BLACK);
    sprintf(buffer, "Score: %d", score);

    drawString3(40, 90, "GAME OVER!", WHITE);

    drawString3(50, 90, buffer, WHITE);
    drawString3(60, 85, "Press START to", WHITE);
    drawString3(70, 85, "return to menu", WHITE);
    waitForVBlank();

 }

// Runs every frame of the lose state
void lose() {


    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        main();
}

