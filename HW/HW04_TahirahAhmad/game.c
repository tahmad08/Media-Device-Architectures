#include <stdlib.h>
#include "myLib.h"
#include "game.h"

PLAYER player;
BALL ball;
BRICK bricks[BRICKCOUNT];
int bricksRemaining;
int ballOOB;
int go;
// Initialize the game
void initGame() {
    //initialize the player
    initPlayer();

    initBall();
    //initialize the bricks
    initBricks();
    bricksRemaining = 36;
    //this variable will end the game if your ball goe Out Of Bounds
    ballOOB = 1;
}

// Updates the game each frame
void updateGame() {

    updatePlayer();
    //will pause the ball on screen until you hit start again
    if(BUTTON_PRESSED(BUTTON_B)) {
        go = 1;
    }
    // nice
    if (go) {
        updateBall();
    }
    //update the bricks
    for (int i = 0; i < BRICKCOUNT; i++) {
        updateBrick(&bricks[i]);
    }
}
// Draws the game each frame
void drawGame() {

    drawPlayer();
    drawBall();

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
    player.width = 30;
    player.color = LIGHTGREEN;

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

// Initialize the ball
void initBall() {
    //Initialize the data for all of the balls as per the instructions
    ball.height = 3;
    ball.width = 3;
    ball.row = rand() % 20 + 70;
    ball.col = rand() % 50 + 80; ;
    ball.oldRow = ball.row;
    ball.oldCol = ball.col;
    ball.rdel = 1;
    ball.cdel = 1;
    ball.color = WHITE;
    ball.active = 1;
    ball.erased = 0;
}

void drawBall() {
    if (ball.active) {
        drawRect(ball.oldRow, ball.oldCol, ball.height, ball.width, BLACK);
        drawRect(ball.row, ball.col, ball.height, ball.width, ball.color);
    } else if (!ball.erased) {
        drawRect(ball.oldRow, ball.oldCol, ball.height, ball.width, BLACK);
        ball.erased = 1;
    }

    ball.oldRow = ball.row;
    ball.oldCol = ball.col;
}

void updateBall() {
    // Bounce the ball off the sides of the box

    if (ball.row <= 0)
        ball.rdel *= -1;
    if (ball.col <= 0 || ball.col + ball.width - 1 >= SCREENWIDTH-1)
        ball.cdel *= -1;

    if(collision(ball.row, ball.col, ball.height,
            ball.width, player.row, player.col, player.height, player.width)){
        ball.rdel *= -1;
        // ball.cdel *= -1;
    }


    if(ball.row + ball.height-1 >= 159) {
        ball.active = 0;
        ballOOB = 0;
    }

    // // Move the ball
    ball.row += ball.rdel;
    ball.col += ball.cdel;
}

void initBricks() {
    int rowStart = 0;
    int colStart = 0;
    int colore = 10000;
    // int purpleGradientColore = rand() % 500 + 10000;

    for (int i = 0; i < BRICKCOUNT; i++) {

        bricks[i].height = 15;
        bricks[i].width = 20;
        bricks[i].row = rowStart;
        bricks[i].col = colStart;
        // bricks[i].color = rand() % 500;
        bricks[i].color = colore;
        // bricks[i].color = purpleGradientColore;
        bricks[i].active = 1;
        bricks[i].erased = 0;

        if (colStart < 240) {
            colStart = colStart + 20;
            // purpleGradientColore += 6;
        }

        if (colStart > 239) {
            rowStart = rowStart + 15;
            colore += 8192;
            // purpleGradientColore += 8192;
            colStart = 0;
        }

    }
}

//Handle every-frame actions of a brick
void updateBrick(BRICK* b) {

    if (b->active) {

        // Handle brick-ball collisions
        // loops through all the,
        //and if an active ball is hitting this brick,
        //put the ball back in the pool, and update the score.

        if(collision(ball.row, ball.col, ball.height,
            ball.width, b->row, b->col, b->height, b->width)){

            // this will change the balls direction if it collides with a brick
            ball.rdel *= -1;
            // ball.cdel *= -1;
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