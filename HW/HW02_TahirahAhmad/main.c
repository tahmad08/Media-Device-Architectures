#include "myLib.h"
#include <stdlib.h>

// Prototypes
void initialize();
void update();
void draw();
// void delBlock();
void delRedBlock();
// void drawFallingBlocks();
int endGame();
void endScreen();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Background Variables
unsigned short bgColor;

int score;

// Red Paddle Rectangle Variables
int rRow;
int rCol;
int rOldRow;
int rOldCol;
int rRDel;
int rCDel;
int rHeight;
int rWidth;

// Green Rectangle Variables
int gRow;
int gCol;
int gOldRow;
int gOldCol;
int gRDel;
int gCDel;
int gHeight;
int gWidth;

// Blue Rectangle Variables
int bRow;
int bCol;
int bOldRow;
int bOldCol;
int bRDel;
int bCDel;
int bHeight;
int bWidth;

int main() {

    initialize();

    while(1) {

        // TODO #3.6: Update the button variables each frame
        oldButtons = buttons;
        buttons = BUTTONS;


        update();
        waitForVBlank();
        if (endGame()) {
            break;
        }
        draw();
    }

    endScreen();
    // if (BUTTON_PRESSED(BUTTON_START)) {
    //     main();
    // }
}

// Sets up the display and the game objects
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    buttons = BUTTONS;
    oldButtons = 0;

    // Initialize background
    bgColor = BLACK;
    fillScreen(bgColor);

    // Red Rectangle Variables
    rRow = gRow;
    rCol = 233;
    rOldRow = gOldRow;
    rOldCol = rCol;
    rRDel = gRDel;
    rCDel = 1;
    rHeight = 20;
    rWidth = 6;

    // Green rectangle
    gRow = 120;
    gCol = 20;
    gOldRow = gRow;
    gOldCol = gCol;
    gRDel = 1;
    gCDel = 1;
    gHeight = 5;
    gWidth = 5;

    // Blue rectangle
    bRow = 120;
    bCol = 1;
    bOldRow = bRow;
    bOldCol = bCol;
    bRDel = 1;
    bCDel = 1;
    bHeight = 20;
    bWidth = 6;


}

// Performs all of the game's calculations
void update() {

    // Move the blue rectangle with the buttons
    if(BUTTON_HELD(BUTTON_UP)) {
        bRow = bRow - 2;

    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        bRow = bRow + 2;
    }

    // Bounce green rectangle off the walls
    if (gRow <= 0 || gRow + gHeight - 1 >= SCREENHEIGHT - 1) {
        gRDel *= -1;
    }
    if (gCol <= 0 || gCol + gWidth - 1 >= SCREENWIDTH - 6) {
        gCDel *= -1;
    }

    //Keeps the paddle (blue rectangle) from going offscreen
    if (bRow <= 0 || bRow + bHeight - 1 >= SCREENHEIGHT - 1) {
        bRow = bOldRow;
    }

    //keeps the paddle on screen
    if (rRow <= 0 || rRow + rHeight - 1 >= SCREENHEIGHT - 1) {
        rRow = rOldRow;
    }

    // Bounce green rectangle off the blue rectangle and red rectangle
    if (collision(gRow, gCol, gHeight, gWidth, bRow, bCol, bHeight, bWidth)) {
        if (gCol < 120) {
            gRDel *= 1;
        }
        gCDel *= -1;
        score++;
    }

    //bounces the green ball off REDs paddle
    if (collision(rRow, rCol, rHeight, rWidth, gRow, gCol, gHeight, gWidth)) {
        gRDel *= -1;
        gCDel *= -1;
    }

    // Update green rectangle's position
    gRow += 2 * gRDel;
    gCol += 2 * gCDel;

    //update the reds position. ya just can't win boi
    rRow += rRDel;

}

// Performs all of the writing to the screen
void draw() {

    // Erase the previous locations
    drawRect(gOldRow, gOldCol, gHeight, gWidth, bgColor);
    drawRect(bOldRow, bOldCol, bHeight, bWidth, bgColor);
    drawRect(gOldRow, rOldCol, rHeight, rWidth, bgColor);

    // Draw the new locations
    drawRect(gRow, gCol, gHeight, gWidth, GREEN);
    drawRect(bRow, bCol, bHeight, bWidth, BLUE);
    drawRect(gRow, rCol, rHeight, rWidth, RED);

    // Update old variables
    gOldRow = gRow;
    gOldCol = gCol;
    bOldRow = bRow;
    bOldCol = bCol;
    rOldRow = gRow;
    rOldCol = rCol;

}

//end game if the green square hits the left screen (miss with paddle)
int endGame() {
    if (gCol <= 0) {
        return 1;
    }
    return 0;

}

//make everything black and display the L for LOSER
void endScreen() {
    drawRect(gOldRow, gOldCol, gHeight, gWidth, bgColor);
    drawRect(bOldRow, bOldCol, bHeight, bWidth, bgColor);
    drawRect(rOldRow, rOldCol, rHeight, rWidth, bgColor);
    drawRect(35, 80, 85, 30, RED);
    drawRect(100, 110, 20, 40, RED);
}