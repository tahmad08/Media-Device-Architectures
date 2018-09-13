//I want to use timers to spawn the enemies but I'm not really sure how to yet, so i ended up using frame counting

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "startscrn.h"
#include "instrscrn.h"
#include "pausescrn.h"
#include "gamescrn.h"
#include "losescrn.h"
#include "winscrn.h"
#include "spritesht.h"

//Prototypes
void initialize();
void goToStart();
void start();
void goToInstr();
void instr();
void goToGame();
void game();
void updateGame();
void drawGame();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void initPlayer();
void updatePlayer();

void initBullet();
void fireBullet();

//initialize values for the enemies
void initEnemies1();

//vertical and horizontal offsets
int hOff = 0;
int vOff = 0;
int arr[35];

//shadowOAM setup
OBJ_ATTR shadowOAM[128];

// States for game
enum {START, INSTR, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

//player struct
typedef struct {
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int bulletTimer;
    int aniCounter;
    int enemy1Timer;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int shadowOam;
} PLAYER;

PLAYER player;

//Enemy1 type struct
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
    int shadowOam;

} ENEMY1;

#define ENEMY1COUNT 40
ENEMY1 enemy1[ENEMY1COUNT];
void spawnEnemy1();
void updateEnemy1(ENEMY1 *);

//this int is going to be the max number of enemy 1 types on screen. after a certain period of time, the number will increase to increase difficulty
volatile int maxEnemy1;
//counts number of active enemies currently
volatile int enemy1onscrn;

//bullet struct
typedef struct {
    int row;
    int col;
    int rdel;
    int height;
    int width;
    int active;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
    int shadowOam;

} BULLET;

#define BULLETCOUNT 10

BULLET bullet[BULLETCOUNT];
void updateBullet(BULLET *);

// States for the sprites variable
enum { PLAYERFRONT, EMPTY, ENEMY_1, ENEMY_2, ENEMY_3, BLLTSPRT, LIVESPRITE};

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
            case INSTR:
                instr();
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

void initialize() {
    //initially can only have a max of 10 on screen. 10 is a little much but i want to see if the player.enemy1timer will curb the amount of enemies anyway
    maxEnemy1 = 5;
    enemy1onscrn = 0;

    //load the sprites
    DMANow(3, spriteshtPal, SPRITEPALETTE, spriteshtPalLen/2);
    DMANow(3, spriteshtTiles, &CHARBLOCK[4], spriteshtTilesLen/2);

    //hide em
    hideSprites();

    //enable mode 0, background 0, and the sprites
    //IF YOU WANT YOUR GAME STATES TO NOT HAVE THE SPRITES, MOVE SPRITE_ENABLE ELSEWHERE
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // // Set up Background 0
    initPlayer();
    initBullet();
    // initLives();
    initEnemies1();

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

    if(BUTTON_PRESSED(BUTTON_SELECT)){
        goToInstr();
    }
}

// Sets up the instructions state
void goToInstr() {
    waitForVBlank();
    flipPage();
    state = INSTR;
}

// Sets up the game state
void goToGame() {
    waitForVBlank();
    flipPage();
    // load the game screen into DMA

    DMANow(3, gamescrnPal, PALETTE, gamescrnPalLen/2);
    DMANow(3, gamescrnTiles, &CHARBLOCK[0], gamescrnTilesLen/2);
    DMANow(3, gamescrnMap, &SCREENBLOCK[28], gamescrnMapLen/2);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;
    state = GAME;
}

void instr() {

    hideSprites();

    //load the win screen into DMA
    DMANow(3, instrscrnPal, PALETTE, instrscrnPalLen/2);
    DMANow(3, instrscrnTiles, &CHARBLOCK[0], instrscrnTilesLen/2);
    DMANow(3, instrscrnMap, &SCREENBLOCK[28], instrscrnMapLen/2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();

    //Copy the shadowOAM into the OAM
    DMANow(3, shadowOAM, OAM, 128*4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    flipPage();

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
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

    } else if (BUTTON_PRESSED(BUTTON_SELECT))
        main();
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
    player.width = 8;
    player.height = 8;
    player.cdel = 2;
    player.rdel = 2;
    player.row = 125;
    player.col = 118;
    player.bulletTimer = 20;
    player.aniCounter = 0;
    player.enemy1Timer = 0;
    player.curFrame = 0;
    player.numFrames = 1;
    player.shadowOam = 0;
    player.aniState = PLAYERFRONT;
}

void updatePlayer() {
    if (BUTTON_HELD(BUTTON_LEFT)
        && player.col >= player.cdel) {

        player.col -= player.cdel;

    } else if (BUTTON_HELD(BUTTON_RIGHT)
        && player.col + player.width < SCREENWIDTH - player.cdel) {

        player.col += player.cdel;

    } else if (BUTTON_HELD(BUTTON_UP)
        && player.row >= player.rdel) {
        player.row -= player.rdel;

    } else if (BUTTON_HELD(BUTTON_DOWN)
        && player.row + player.height - 1 < SCREENHEIGHT - player.rdel) {

        player.row += player.rdel;
    }


    if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 30) {
        fireBullet();
        player.bulletTimer = 0;
    }
    player.bulletTimer++;

    if (player.enemy1Timer % 10 == 0) {
        spawnEnemy1();
    }
    player.enemy1Timer++;
}

void initBullet() {

    for (int i = 0; i < BULLETCOUNT; i++) {
        bullet[i].row = player.row;
        bullet[i].col = player.col+ player.width/2 - bullet[i].width/2;
        bullet[i].rdel = -2;
        bullet[i].height = 8;
        bullet[i].width = 8;
        bullet[i].active = 0;
        bullet[i].aniCounter = 0;
        bullet[i].curFrame = 0;
        bullet[i].numFrames = 2;
        bullet[i].shadowOam = i + 21;
        bullet[i].aniState = BLLTSPRT;

    }
}

void fireBullet() {
    // Find the first inactive bullet
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullet[i].active) {

            // Position the new bullet
            bullet[i].row = player.row;
            bullet[i].col = player.col + player.width/2
                - bullet[i].width/2;

            // Take the bullet out of the pool
            bullet[i].curFrame++;
            bullet[i].active = 1;

            // Break out of the loop
            break;
        }
    }
}

void updateBullet(BULLET* b) {

    // If active, update; otherwise ignore
    if (b->active) {
        if (b->row - 5 > 0) {
            b->row += b->rdel;
            // b->col += b->cdel;
        } else {
            b->active = 0;
            b->curFrame = 0;
            shadowOAM[b->shadowOam].attr0 |= ATTR0_HIDE;
        }
    }
}

void initEnemies1() {
    for (int i = 0; i < ENEMY1COUNT; i++) {
        enemy1[i].row = 0;
        enemy1[i].col = rand() % 240;
        enemy1[i].rdel = 1;
        enemy1[i].width = 8;
        enemy1[i].height = 8;
        enemy1[i].active = 0;
        enemy1[i].aniCounter = 0;
        enemy1[i].prevAniState = 0;
        enemy1[i].curFrame = 0;
        enemy1[i].numFrames = 1;
        enemy1[i].shadowOam = i + 1;
        enemy1[i].aniState = LIVESPRITE;
    }
}
void spawnEnemy1() {
    // if ((enemy1onscrn < maxEnemy1)) {
    for (int i = 0; i < ENEMY1COUNT; i++) {
        if (!enemy1[i].active) {
            enemy1[i].row = 0;
            enemy1[i].col = rand() % 240;
            enemy1[i].active = 1;
            enemy1onscrn++;
            break;
        }
    }
    //}
}
void updateEnemy1(ENEMY1 *e) {
    // If active, update; otherwise ignore
    if (e->active) {
        if(e->row < 160 && e->col < 240) {
            e->row += e->rdel;
            if (e->row + e->height >= SCREENHEIGHT - 2) {
                e->active = 0;
                shadowOAM[e->shadowOam].attr0 |= ATTR0_HIDE;
                enemy1onscrn--;
            }
        } else if (!(e->row < 160 && e->col < 240)) {
            e->active = 0;
            shadowOAM[e->shadowOam].attr0 |= ATTR0_HIDE;
        }
    } else {
        shadowOAM[e->shadowOam].attr0 |= ATTR0_HIDE;
    }
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (collision (bullet[i].row, bullet[i].col, bullet[i].height, bullet[i].width, e->row, e->col, e->height, e->width)) {
            bullet[i].active = 0;
            enemy1onscrn--;
            e->active = 0;
            e->aniState = ENEMY_1;
            shadowOAM[e->shadowOam].attr0 |= ATTR0_HIDE;
            shadowOAM[bullet[i].shadowOam].attr0 |= ATTR0_HIDE;
        }
    }


}

void updateGame() {
    updatePlayer();
    for (int i = 0; i < BULLETCOUNT; i++) {
        updateBullet(&bullet[i]);
    }
    for (int i = 0; i < ENEMY1COUNT; i++) {
        if (enemy1[i].active)
            updateEnemy1(&enemy1[i]);
    }
}

void drawGame() {

    //sets up the players attributes
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.col | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame, player.aniState);

    for (int i = 0; i < ENEMY1COUNT; i++) {
        if(enemy1[i].active) {
            shadowOAM[i+1].attr0 = enemy1[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i+1].attr1 = enemy1[i].col | ATTR1_TINY;
            shadowOAM[i+1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy1[i].curFrame, enemy1[i].aniState);
        }
    }

    for (int i = 0; i < BULLETCOUNT; i++) {
        if(bullet[i].active) {
            shadowOAM[i+21].attr0 = bullet[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i+21].attr1 = bullet[i].col | ATTR1_TINY;
            shadowOAM[i+21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bullet[i].curFrame, bullet[i].aniState);
        }
    }
    waitForVBlank();

}
