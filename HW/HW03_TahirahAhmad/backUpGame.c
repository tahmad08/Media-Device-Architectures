#include <stdlib.h>
#include "myLib.h"
#include "game.h"

PLAYER player;
BULLET bullet;
BRICK bricks[BRICKCOUNT];
int bricksRemaining;
int bulletOOB;
int go;
// Initialize the game
void initGame() {
    //initialize the player
    initPlayer();

    // intialize the bullet
    initBullet();
    //initialize the bricks
    initBricks();
    bricksRemaining = BRICKCOUNT;
    //this variable will end the game if your bullet goe Out Of Bounds
    bulletOOB = 1;
}

// Updates the game each frame
void updateGame() {

    updatePlayer();
    //will pause the bullet on screen until you hit start again
    if(BUTTON_PRESSED(BUTTON_START)) {
        go = 1;
    }
    // nice
    if (go) {
        updateBullet();
    }
    //update the bricks
    for (int i = 0; i < BRICKCOUNT; i++) {
        updateBrick(&bricks[i]);
    }
}
// Draws the game each frame
void drawGame() {

    drawPlayer();
    drawBullet();

    // Draw all the bricks
    for (int i = 0; i < BRICKCOUNT; i++) {
        drawBrick(&bricks[i]);
    }
}

// // Initialize the player
void initPlayer() {

    player.row = 140;
    player.col = 118;
    player.oldRow = player.row;
    player.oldCol = player.col;
    player.cdel = 4;
    player.height = 2;
    player.width = 20;
    player.color = GREEN;

}

// Handle every-frame actions of the player
void updatePlayer() {

    // Move the player
    if (BUTTON_HELD(BUTTON_LEFT)
        && player.col >= player.cdel) {

        player.col -= player.cdel;

    } else if (BUTTON_HELD(BUTTON_RIGHT)
        && player.col + player.width - 1 < SCREENWIDTH - player.cdel) {

        player.col += player.cdel;
    }
}

// Draw the player
void drawPlayer() {

    drawRect(player.oldRow, player.oldCol, player.height, player.width, BLACK);
    drawRect(player.row, player.col, player.height, player.width, player.color);

    player.oldRow = player.row;
    player.oldCol = player.col;
}

// Initialize the bullet
void initBullet() {
    //Initialize the data for all of the bullets as per the instructions
    bullet.height = 3;
    bullet.width = 3;
    bullet.row = rand() % 20 + 70;
    bullet.col = rand() % 50 + 80; ;
    bullet.oldRow = bullet.row;
    bullet.oldCol = bullet.col;
    bullet.rdel = 1;
    bullet.cdel = 1;
    bullet.color = WHITE;
    bullet.active = 1;
    bullet.erased = 0;
}

void drawBullet() {
    if (bullet.active) {
        drawRect(bullet.oldRow, bullet.oldCol, bullet.height, bullet.width, BLACK);
        drawRect(bullet.row, bullet.col, bullet.height, bullet.width, bullet.color);
    } else if (!bullet.erased) {
        drawRect(bullet.oldRow, bullet.oldCol, bullet.height, bullet.width, BLACK);
        bullet.erased = 1;
    }

    bullet.oldRow = bullet.row;
    bullet.oldCol = bullet.col;
}

void updateBullet() {
    // Bounce the bullet off the sides of the box

    if (bullet.row <= 0)
        bullet.rdel *= -1;
    if (bullet.col <= 0 || bullet.col + bullet.width - 1 >= SCREENWIDTH-1)
        bullet.cdel *= -1;

    // // Move the bullet

    bullet.row += bullet.rdel;
    bullet.col += bullet.cdel;

    if(collision(bullet.row, bullet.col, bullet.height,
            bullet.width, player.row, player.col, player.height, player.width)){
        // if (bullet.col < 120) {

        // }
        bullet.rdel *= -1;
        // bullet.cdel *= -1;
    }

    if(bullet.row + bullet.height-1 >= 159) {
        bullet.active = 0;
        bulletOOB = 0;
    }

}

void initBricks() {
    int rowStart = 10;
    int colStart = 10;

    for (int i = 0; i < BRICKCOUNT; i++) {

        bricks[i].height = 10;
        bricks[i].width = 20;
        bricks[i].row = rowStart;
        bricks[i].col = colStart;
        bricks[i].color = rand() % 500;
        bricks[i].active = 1;
        bricks[i].erased = 0;

        if (colStart < 220) {
            colStart = colStart + 20;
        }

        if (colStart > 220) {
            rowStart = rowStart + 10;
            colStart = 10;
        }

    }
}

//Handle every-frame actions of a brick
void updateBrick(BRICK* b) {

    if (b->active) {

        // Handle brick-bullet collisions
        // loops through all the,
        //and if an active bullet is hitting this brick,
        //put the bullet back in the pool, and update the score.

        if(collision(bullet.row, bullet.col, bullet.height,
            bullet.width, b->row, b->col, b->height, b->width)){

            // this will change the bullets direction if it collides with a brick
            bullet.rdel *= -1;
            // bullet.cdel *= -1;
            b->active = 0;
            bricksRemaining--;
        }
    }
}

void drawBrick(BRICK* b) {

    if(b->active) {
        drawRect(b->row, b->col, b->height, b->width, b->color);
    } else if (!b->erased) {
        drawRect(b->row, b->col, b->height, b->width, BLACK);
        b->erased = 1;
    }

}