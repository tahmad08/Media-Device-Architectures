// to change the speed of the enemies, change the 10 in line  "if (player.aniCounter % 10 == 0)"
/*  === Animation Variables ===
*   aniCounter: Used to count how many frames have passed
*   curFrame: which frame of animation pikachu is in (row in spritesheet)
*   numFrames: the total number of frames
*   aniState: which state of animation pikachu is in (column in spritesheet)
*/
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
void fireBullet();
void initPlayer();

void initBullet();

void initEnemies();
void updatePlayer();
void updateEnemies();

void updateBullet();

void initLives();
void drawGame();
void bottomRowUpdate(int);

//vertical and horizontal offsets
int hOff = 0;
int vOff = 0;
int arr[35];

//shadowOAM setup
OBJ_ATTR shadowOAM[128];

//player struct
typedef struct {
    int row;
    int col;
    int cdel;
    int width;
    int height;
    int bulletTimer;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} PLAYER;

// create a player type PLAYER lol
PLAYER player;

#define ENEMYCOUNT 35
#define LIFECOUNT 3

typedef struct {
    int row;
    int col;
    int width;
    int height;
    int active;
    int aniState;
    int curFrame;
    int numFrames;
} LIFE;

LIFE lives[LIFECOUNT];

//Sprites struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int active;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} ANISPRITE;

ANISPRITE enemy[ENEMYCOUNT];

volatile int remaining;
volatile int endCol;
volatile int startCol;
volatile int endColDel;
volatile int startColDel;
volatile int bottomRow;
volatile int bottomRowDel;


//bullet struct
typedef struct {
    int row;
    int col;
    int rdel;
    // int cdel;
    int height;
    int width;
    int active;
    int aniCounter;
    int aniState;
    // int prevAniState;
    int curFrame;
    int numFrames;
} BULLET;

#define BULLETCOUNT 20

BULLET bullet;

// States for the sprites variable
enum { PLAYERFRONT, EMPTY, ENEMY_1, ENEMY_2, ENEMY_3, BULLETSPRITE, LIVESPRITE };

// States for game
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {
    hideSprites();
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
    remaining = 35;
    endCol = 96;
    startCol = 5;
    endColDel = 10;
    startColDel = 10;
    bottomRow = 65;
    bottomRowDel = 10;

    //when initializing, load the start screen
    DMANow(3, startscrnPal, PALETTE, startscrnPalLen/2);
    DMANow(3, startscrnTiles, &CHARBLOCK[0], startscrnTilesLen/2);
    DMANow(3, startscrnMap, &SCREENBLOCK[28], startscrnMapLen/2);

    //load the sprites
    DMANow(3, spriteshtPal, SPRITEPALETTE, spriteshtPalLen/2);
    DMANow(3, spriteshtTiles, &CHARBLOCK[4], spriteshtTilesLen/2);

    hideSprites();

    //enable mode 0, background 0, and the sprites
    //IF YOU WANT YOUR GAME STATES TO NOT HAVE THE SPRITES, MOVE SPRITE_ENABLE ELSEWHERE
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // Set up Background 0
    initPlayer();
    initBullet();
    initLives();
    initEnemies();

    buttons = BUTTONS;

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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
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
}

// Sets up the game state
void goToGame() {
    state = GAME;
}

// Runs every frame of the game state
void game() {
    drawGame();

    //Copy the shadowOAM into the OAM
    DMANow(3, shadowOAM, OAM, 128*4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    flipPage();

    if (bottomRow - 5 >= player.row) {
        goToLose();
    }
    if (remaining == 0) {
        goToWin();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
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
        goToGame();

    }else if (BUTTON_PRESSED(BUTTON_SELECT))
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
    //wait for vertical blank and flip the page

    waitForVBlank();
    flipPage();

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {

    hideSprites();
    //load the lose screen into DMA
    DMANow(3, losescrnPal, PALETTE, losescrnPalLen/2);
    DMANow(3, losescrnTiles, &CHARBLOCK[0], losescrnTilesLen/2);
    DMANow(3, losescrnMap, &SCREENBLOCK[28], losescrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        main();
}

void initPlayer() {
    //init the player
    player.width = 8;
    player.height = 8;
    player.cdel = 2;
    player.row = 125;
    player.col = 118;
    player.bulletTimer = 0;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 1;
    player.aniState = PLAYERFRONT;
}

void initBullet() {

    bullet.width = 8;
    bullet.height = 8;
    bullet.rdel = 2;
    bullet.row = player.row;
    bullet.col = player.col + player.width/2 - bullet.width/2;
    bullet.active = 0;
    bullet.curFrame = 0;
    bullet.numFrames = 2;
    bullet.aniState = BULLETSPRITE;
}

void initLives() {
    int colStart = 200;
    for (int i = 0; i < LIFECOUNT; i++) {
        lives[i].row = 140;
        lives[i].col = colStart;
        lives[i].width = 8;
        lives[i].height = 8;
        lives[i].active = 1;
        lives[i].aniState = LIVESPRITE;
        lives[i].curFrame = 0;
        lives[i].numFrames = 2;
        colStart += 10;
    }
}
void initEnemies() {
    // for initializing the locations of the sprites
    int colStart = -8;
    int rowStart = 5;

    for (int i = 0; i < ENEMYCOUNT; i++) {

        if (i < 7) {
            colStart = colStart + 13;
            enemy[i].aniState = ENEMY_1;
        } else if (i >= 7 && i < 14) {
            if (i == 7) {
                rowStart = rowStart + 13;
                colStart = 5;
            } else {
                colStart = colStart + 13;
            }
            enemy[i].aniState = ENEMY_2;

        } else if(i >= 14 && i < 21){
            if (i == 14) {
                rowStart = rowStart + 13;
                colStart = 5;
            } else {
                colStart += 13;
            }
            enemy[i].aniState = ENEMY_3;
        } else if (i >= 21 && i < 28) {
            if (i == 21) {
                rowStart = rowStart + 13;
                colStart = 5;
            } else {
                colStart += 13;
            }
            enemy[i].aniState = ENEMY_1;
        } else {
            if (i == 28) {
                rowStart = rowStart + 13;
                colStart = 5;
            } else {
                colStart += 13;
            }
            enemy[i].aniState = ENEMY_3;
        }
        enemy[i].width = 8;
        enemy[i].height = 8;
        enemy[i].rdel = 10;
        enemy[i].cdel = 10;
        enemy[i].row = rowStart;
        enemy[i].col = colStart;
        enemy[i].active = 1;
        enemy[i].aniCounter = 0;
        enemy[i].curFrame = 0;
        enemy[i].numFrames = 2;

    }
}

void updatePlayer() {
    if (BUTTON_HELD(BUTTON_LEFT)
        && player.col >= player.cdel) {

        player.col -= player.cdel;

    } else if (BUTTON_HELD(BUTTON_RIGHT)
        && player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

        player.col += player.cdel;
    }
    if (BUTTON_PRESSED(BUTTON_A) && !bullet.active) {
        //position the bullet
        bullet.col = player.col + player.width/2 - bullet.width/2;
        bullet.row = player.row;

        //activate it
        bullet.curFrame++;
        bullet.active = 1;
    }
}

void updateBullet() {
    if (bullet.row > 1) {
        bullet.row -= bullet.rdel;
    } else {
        bullet.curFrame = 0;
        bullet.active = 0;
    }

}

void updateEnemies() {
    // enemy movement logic. every 10 frames, check the location of the enemies (one edge of screen?) and move them accordingly
    if (player.aniCounter % 40 == 0) {
        //if the enemy on the far right has touched the end of the screen, have all the enemies shift down 10 rows and * their cdel by -1 to change direction
        if ((endCol + 5 > SCREENWIDTH)) {
            for (int i = 0; i < ENEMYCOUNT; i++) {
                if (enemy[i].active) {
                    enemy[i].row += enemy[i].rdel;
                    enemy[i].cdel *= -1;
                }
            }
            endColDel *= -1;
            startColDel *= -1;
            bottomRow += bottomRowDel;

        }
        else if (enemy[1].row > 5 && startCol-2 < 1) {
            for (int i = 0; i < ENEMYCOUNT; i++) {
                if (enemy[i].active) {
                    enemy[i].row += enemy[i].rdel;
                    enemy[i].cdel *= -1;
                }
            }
            endColDel *= -1;
            startColDel *= -1;
            bottomRow += bottomRowDel;
        }
        else {
            for (int i = 0; i < ENEMYCOUNT; i++) {
                if (enemy[i].active) {
                    enemy[i].col += enemy[i].cdel;
                    if (player.aniCounter % 20 == 0 && (enemy[i].aniState == ENEMY_2 || enemy[i].aniState == ENEMY_3) && enemy[i].active) {
                        enemy[i].curFrame++;
                        if (enemy[i].curFrame >= enemy[i].numFrames) {
                            enemy[i].curFrame = 0;
                        }
                    }
                }
            }
        }
        endCol += (endColDel);
        startCol += (startColDel);
    }
    for (int i = 0; i < ENEMYCOUNT; i++) {
        //if there is a collision between a bullet and an enemy, then set it to inactive, lower the number of enemies (REMENEMIES)
        // change the frame to a blank one
        //int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB
        if (enemy[i].active) {
            if ((bullet.curFrame == 1 && bullet.active) && collision(bullet.row, bullet.col, bullet.height-2, bullet.width-3,
                enemy[i].row, enemy[i].col, enemy[i].height, enemy[i].width)) {

                arr[i] = i;
                bottomRowUpdate(((i/7)*7));
                remaining--;
                bullet.active = 0;
                bullet.curFrame = 0;
                enemy[i].active = 0;
                shadowOAM[i+2].attr0 |= ATTR0_HIDE;
            }
        }
    }
}

void bottomRowUpdate(int i) {
    return;
}

void drawGame() {
    // load the game screen into DMA
    DMANow(3, gamescrnPal, PALETTE, gamescrnPalLen/2);
    DMANow(3, gamescrnTiles, &CHARBLOCK[0], gamescrnTilesLen/2);
    DMANow(3, gamescrnMap, &SCREENBLOCK[28], gamescrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;

    //player Logic
    updatePlayer();
    if (bullet.active) {
        updateBullet();
    }
    updateEnemies();


    player.aniCounter++;
    player.bulletTimer++;

    //sets up the players attributes
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.col | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame, player.aniState);

    shadowOAM[1].attr0 = bullet.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr1 = bullet.col | ATTR1_TINY;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bullet.curFrame, bullet.aniState);

    //sets up and updates the enemies atributes
    for (int i = 0; i < ENEMYCOUNT; i++) {
        if(enemy[i].active) {
            shadowOAM[i+2].attr0 = enemy[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i+2].attr1 = enemy[i].col | ATTR1_TINY;
            shadowOAM[i+2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy[i].curFrame, enemy[i].aniState);
        }
    }
    for (int i = 0; i < LIFECOUNT; i++) {
        if(lives[i].active) {
            shadowOAM[i+38].attr0 = lives[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i+38].attr1 = lives[i].col | ATTR1_TINY;
            shadowOAM[i+38].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(lives[i].curFrame, lives[i].aniState);
        }
    }

    waitForVBlank();
}