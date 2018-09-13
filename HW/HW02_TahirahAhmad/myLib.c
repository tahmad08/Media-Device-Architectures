#include "myLib.h"
#include <stdlib.h>

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {

    int r,c;
    for(r = 0; r < height; r++) {
        for(c = 0; c < width; c++) {
            setPixel(row+r, col+c, color);
        }
    }
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 160*240; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

int collision(int rowA, int colA, int heigthA, int widthA, int rowB, int colB, int heightB, int widthB)
{
    int rowInRange = 0;
    int colInRange = 0;
    if (rowA <= (rowB + heightB))
    {
        if (rowB <= (rowA + heigthA))
        {
            rowInRange = 1;
        }
    }

    if (colA <= (colB + widthB))
    {
        if(colA <= (colA + widthA))
        {
            colInRange = 1;
        }
    }

    if (rowInRange + colInRange > 1) {
        return 1;
    }
    return 0;
}

void delay(int amount) {
    int i;
    volatile int b;
    for(i=0;i < amount * 20000;i++) {
        b++;
    }
}