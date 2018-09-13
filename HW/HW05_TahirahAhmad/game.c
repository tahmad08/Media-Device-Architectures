#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "badBoi.h"
#include "goodBoi.h"
#include "blueBoi.h"
#include "catcher.h"

// Variables for a player, bullets, balls (hearts and squares)
PLAYER player;
BULLET bullets[BULLETCOUNT];
BALL balls[BALLCOUNT];
//these two keep track of how many hearts and health you have
int hearts;
int health;
int j;
// Initialize the game
void initGame() {

	initPlayer();
    initBullets();
    initBalls();
    // Initialize the health and hearts
	hearts = 0;
	health = 15;
	j = 0;
	//that color thing the TA's did??????
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY, YELLOW, LIGHTGREEN};
    //load the main palette into the GBA
    DMANow(3, catcherPal, PALETTE, 256);

    // Load the custom game colors to the end
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

// Updates the game each frame
void updateGame() {

	updatePlayer();

	// Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++){
		updateBullet(&bullets[i]);
	}

	// Update all the balls
	for (int i = 0; i < BALLCOUNT; i++){
		updateBall(&balls[i]);
	}
}

// Draws the game each frame
void drawGame() {
	//make balck
    fillScreen4(BLACKID);
    //draw the three men
	drawPlayer();

	// Draw all the bullets
	for (int i = 0; i < BULLETCOUNT; i++) {
		drawBullet(&bullets[i]);
	}

	// Draw all the balls
	for (int i = 0; i < BALLCOUNT; i++) {
		drawBall(&balls[i]);
	}
}


// Initialize the player
void initPlayer() {

	player.row = 125;
	player.col = 118;
	player.cdel = 2;
	player.height = 16;
	player.width = 24;
	player.bulletTimer = 20;
	player.ballTimer = 20;
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

	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 15) {

		fireBullet();
		player.bulletTimer = 0;
	}

	player.bulletTimer++;
	// keeps the hearts and squares from appearing all at once
	//releases a new one every 20 frames
	if (player.ballTimer >= 20) {

		reInitBall();
		player.ballTimer = 0;
	}

	player.ballTimer++;
}

// Draw the player
void drawPlayer() {

	drawImage4(player.row, player.col, player.height, player.width, catcherBitmap);
}

// Initialize the pool of bullets
void initBullets() {

	for (int i = 0; i < BULLETCOUNT; i++) {

		bullets[i].height = 2;
		bullets[i].width = 4;
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].rdel = -2;
        bullets[i].cdel = 0;
		bullets[i].color = WHITEID;
		bullets[i].active = 0;
	}
}

// Spawn a bullet
void fireBullet() {

	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {

			// Position the new bullet
			bullets[i].row = player.row;
			bullets[i].col = player.col + player.width/2
				- bullets[i].width/2;

			// Take the bullet out of the pool
			bullets[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {

	// If active, update; otherwise ignore
	if (b->active) {
		if (b->row + b->height-1 >= 0 && b->col + b->cdel > 0 && b->col + b->cdel < SCREENWIDTH-1) {
			b->row += b->rdel;
            b->col += b->cdel;

		} else {
			b->active = 0;
		}
	}
}

// Draw a bullet
void drawBullet(BULLET* b) {

	if(b->active) {
		drawRect4(b->row, b->col, b->height, b->width, b->color);
	}
}

// Initialize the balls
void initBalls() {
	int rando = rand();
	for (int i = 0; i < BALLCOUNT; i++) {

		balls[i].height = 12;
		balls[i].width = 12;
		balls[i].row = 0;
		balls[i].col = (rand() + rando  % (SCREENWIDTH + 100)) + 100;
		balls[i].rdel = 2;
        balls[i].isbadBoi = i & 1;
		balls[i].active = 0;
	}
}

//reinitializes the ball
void reInitBall() {
	for (int i = 0; i < BALLCOUNT; i++) {
		if (!(balls[i].active)) {

			// Take the ball out of the pool
			balls[i].row = 0;
			balls[i].col = rand() % 130 + 10;
			balls[i].active = 1;
			j++;
			break;

		}
	}
}
// Handle every-frame actions of a ball
void updateBall(BALL* b) {

	if (b->active) {

		//SUPPOSED to init blue health hearts but those aren't showing up
		if ((j >= 7) && (j % 7 == 0)) {
			b->isHealth = 1;
		}
		//handles natural movement downwards
		b->row += b->rdel;

		//deactivates the ball when it hits the bottom
		if (b->row + b->height- 1 >= SCREENHEIGHT - 1) {
			b->active = 0;
		}

		//collision of player and the falling items.
		//BLUE HEART: if you catch a blue heart, increase health.
		if (collision(b->row, b->col, b->height,
		        b->width, player.row, player.col, player.height, player.width)){
			//if you catch a heart, increase the amount of hearts you have. else, decrease your health.
		    //catch a heart (goodboi), and your hearts go up
		    if (!(b->isbadBoi) && !(b->isHealth)) {
		    	hearts++;
		    } else if (b->isHealth) {
		    	if (health < 15) {
		    		health++;
		    	} else {
		    		health = 15;
		    	}
		    }
		    else if (b->isbadBoi) {
		    	health--;
		    	j++;
		    }
		    b->active = 0;
		}

		//bullet from player and items falling collisions
		//deactivates any ball that is hit and lowers health if a goodboi is hit
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active && collision(b->row, b->col, b->height, b->width,
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {

				// Put ball and bullet back in the pool
				bullets[i].active = 0;
				b->active = 0;
				if (!(b->isbadBoi) && !(b->isHealth)) {
					health--;
					j++;
				}
			}
		}

	}
}

// Draw a ball
void drawBall(BALL* b) {

	if(b->active) {

        if (b->isbadBoi)
		  drawImage4(b->row, b->col, b->height, b->width, badBoiBitmap);
		else if (b->isHealth)
			drawImage4(b->row, b->col, b->height, b->width, blueBoiBitmap);
        else if (!(b->isbadBoi) && !(b->isHealth))
          drawImage4(b->row, b->col, b->height, b->width, goodBoiBitmap);
	}
}
