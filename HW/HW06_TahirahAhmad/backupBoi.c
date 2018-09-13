// to change the speed of the enemies, change the 10 in line  "if (player.aniCounter % 10 == 0)"


#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "startscrn.h"
#include "pausescrn.h"
#include "gamescrn.h"
#include "losescrn.h"
#include "winscrn.h"
#include "spritesht.h"

// Prototypes
void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void updateGame();

//vertical and horizontal offsets
int hOff = 0;
int vOff = 0;

//shadowOAM setup
OBJ_ATTR shadowOAM[128];

//player struct
typedef struct {
    int row;
    int col;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} PLAYER;

// create a player type PLAYER lol
PLAYER player;

//Sprites struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} ANISPRITE;

//bullet struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int height;
    int width;
    unsigned char color;
    int active;
} BULLET;

#define ENEMYCOUNT 18
#define BULLETCOUNT 20

ANISPRITE enemy[ENEMYCOUNT];


// States for the sprites variable
enum { PLAYERFRONT, ENEMY_1, ENEMY_2, ENEMY_3, BULLETSPRITE };

// States for game
enum {START, GAME, PAUSE, WIN, LOSE};
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
        switch(state) {

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

    return 0;
}

// Sets up GBA
void initialize() {

    hideSprites();

    //when initializing, load the start screen
    DMANow(3, startscrnPal, PALETTE, startscrnPalLen/2);
    DMANow(3, startscrnTiles, &CHARBLOCK[0], startscrnTilesLen/2);
    DMANow(3, startscrnMap, &SCREENBLOCK[28], startscrnMapLen/2);

    //load the sprites
    DMANow(3, spriteshtPal, SPRITEPALETTE, spriteshtPalLen/2);
    DMANow(3, spriteshtTiles, &CHARBLOCK[4], spriteshtTilesLen/2);

    //hide the sprites
    // DMANow(3, shadowOAM, OAM, 128*4);

    //enable mode 0, background 0, and the sprites
    //IF YOU WANT YOUR GAME STATES TO NOT HAVE THE SPRITES, MOVE SPRITE_ENABLE ELSEWHERE
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // Set up Background 0
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    //init the player
    player.width = 16;
    player.height = 16;
    player.cdel = 2;
    player.row = 125;
    player.col = 118;
    /*  === Animation Variables ===
    *   aniCounter: Used to count how many frames have passed
    *   curFrame: which frame of animation pikachu is in (row in spritesheet)
    *   numFrames: the total number of frames
    *   aniState: which state of animation pikachu is in (column in spritesheet)
    */
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 1;
    player.aniState = PLAYERFRONT;

    int colStart = -16;
    int rowStart = 5;

    for (int i = 0; i < ENEMYCOUNT; i++) {

        if (i < 6) {
            colStart = colStart + 21;
            enemy[i].aniState = ENEMY_1;
        } else if (i >= 6 && i <12) {
            if (i == 6) {
                rowStart = rowStart + 21;
                colStart = 5;
            } else {
                colStart = colStart + 21;
            }
            enemy[i].aniState = ENEMY_2;

        } else {
            if (i == 12) {
                rowStart = rowStart + 21;
                colStart = 5;
            } else {
                colStart += 21;
            }
            enemy[i].aniState = ENEMY_3;
        }
        enemy[i].width = 16;
        enemy[i].height = 16;
        enemy[i].rdel = 5;
        enemy[i].cdel = 10;
        enemy[i].row = rowStart;
        enemy[i].col = colStart;
        enemy[i].aniCounter = 0;
        enemy[i].curFrame = 0;
        enemy[i].numFrames = 2;

    }

    buttons = BUTTONS;

    // set the voff and hoff initial vals
    // hOff = 0;
    // vOff = 0;

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {


    //Waits for vertical blank and flips the page
    waitForVBlank();
    flipPage();


    state = START;

    // Begin the seed randomization
    seed = 0;
}

// Runs every frame of the start state

void start() {
    //load the start screen into DMA
    DMANow(3, startscrnPal, PALETTE, startscrnPalLen/2);
    DMANow(3, startscrnTiles, &CHARBLOCK[0], startscrnTilesLen/2);
    DMANow(3, startscrnMap, &SCREENBLOCK[28], startscrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;

    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        srand(seed);

        goToGame();
        // initGame();
    }
}

// Sets up the game state
void goToGame() {
    state = GAME;
}

// Runs every frame of the game state
void game() {

    // load the game screen into DMA
    DMANow(3, gamescrnPal, PALETTE, gamescrnPalLen/2);
    DMANow(3, gamescrnTiles, &CHARBLOCK[0], gamescrnTilesLen/2);
    DMANow(3, gamescrnMap, &SCREENBLOCK[28], gamescrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;

    if (BUTTON_HELD(BUTTON_LEFT)
        && player.col >= player.cdel) {

        player.col -= player.cdel;

    } else if (BUTTON_HELD(BUTTON_RIGHT)
        && player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

        player.col += player.cdel;
    }

    // enemy movement logic. every 10 frames, check the location of the enemies (one edge of screen?) and move them accordingly
    if (player.aniCounter % 10 == 0) {
        //if the enemy on the far right (enemy 5) has touched the end of the screen, have all the enemies shift down 5 rows and * their cdel by -1 to change direction
        if ((enemy[5].col + enemy[5].width - 1 > SCREENWIDTH - enemy[5].cdel)) {
            for (int i = 0; i < ENEMYCOUNT; i++) {
                enemy[i].row += enemy[i].rdel;
                enemy[i].cdel *= -1;
            }
        }
        if (enemy[0].col +1 < 1) {
            for (int i = 0; i < ENEMYCOUNT; i++) {
                enemy[i].row += enemy[i].rdel;
                enemy[i].cdel *= -1;
            }
        }
        for (int i = 0; i < ENEMYCOUNT; i++) {
            enemy[i].col += enemy[i].cdel;
            if (player.aniCounter % 20 == 0 && enemy[i].aniState == ENEMY_2) {
                enemy[i].curFrame++;
                if (enemy[i].curFrame >= enemy[i].numFrames) {
                    enemy[i].curFrame = 0;
                }
            }
        }
    }

    player.aniCounter++;
    //sets up and updates the players attributes
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame, player.aniState);

    //sets up and updates the enemies atributes
    for (int i = 0; i < ENEMYCOUNT; i++) {
        shadowOAM[i+1].attr0 = enemy[i].row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[i+1].attr1 = enemy[i].col | ATTR1_SMALL;
        shadowOAM[i+1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy[i].curFrame * 2, enemy[i].aniState *2);
    }

    waitForVBlank();

    //Copy the shadowOAM into the OAM
    DMANow(3, shadowOAM, OAM, 128*4);

    flipPage();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    } else if (BUTTON_PRESSED(BUTTON_A)) {
        goToWin();
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }

}

// Sets up the pause state
void goToPause() {

    waitForVBlank();
    flipPage();


    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {

    //load the pause screen into DMA
    DMANow(3, pausescrnPal, PALETTE, pausescrnPalLen/2);
    DMANow(3, pausescrnTiles, &CHARBLOCK[0], pausescrnTilesLen/2);
    DMANow(3, pausescrnMap, &SCREENBLOCK[28], pausescrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {

    //Wait for vertical blank and flip the page
    waitForVBlank();
    flipPage();


    state = WIN;
}

// Runs every frame of the win state
void win() {

    //load the win screen into DMA
    DMANow(3, winscrnPal, PALETTE, winscrnPalLen/2);
    DMANow(3, winscrnTiles, &CHARBLOCK[0], winscrnTilesLen/2);
    DMANow(3, winscrnMap, &SCREENBLOCK[28], winscrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {
    //wait for vertical blank and flip the page

    waitForVBlank();
    flipPage();

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {

    //load the lose screen into DMA
    DMANow(3, losescrnPal, PALETTE, losescrnPalLen/2);
    DMANow(3, losescrnTiles, &CHARBLOCK[0], losescrnTilesLen/2);
    DMANow(3, losescrnMap, &SCREENBLOCK[28], losescrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;


    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}
