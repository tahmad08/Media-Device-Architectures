#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Set a pixel on the screen in Mode 3
void setPixel3(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

// Set a pixel on the screen in Mode 4
void setPixel4(int row, int col, unsigned char colorIndex) {
    unsigned short pixelData =
        videoBuffer[OFFSET(row, col, SCREENWIDTH)/2];
    if (col & 1) { // column is odd
        pixelData &= 0x00FF;
        pixelData |= (colorIndex<<8);
    } else { // column is even
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[OFFSET(row, col, SCREENWIDTH)/2] = pixelData;

}

// Draw a rectangle at the specified location and size in Mode 3
void drawRect3(int row, int col, int height, int width, volatile unsigned short color) {
 // Paste this code at the beginning of drawRect3, drawRect4, drawImage3, and drawImage4
    if (height <= 0 || width <= 0 || row >= SCREENHEIGHT || col >= SCREENWIDTH)
        return;
    if (row < 0) {
        height += row;
        row = 0;
    }
    if (row + height >= SCREENHEIGHT)
        height = SCREENHEIGHT - row;
    if (col < 0) {
        width += col;
        col = 0;
    }
    if (col + width >= SCREENWIDTH)
        width = SCREENWIDTH - col;
    if (height <= 0 || width <= 0 || row >= SCREENHEIGHT || col >= SCREENWIDTH)
        return;
	for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
	}
}

// Draw a rectangle at the specified location and size in Mode 4
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex) {
 // Paste this code at the beginning of drawRect3, drawRect4, drawImage3, and drawImage4
    if (height <= 0 || width <= 0 || row >= SCREENHEIGHT || col >= SCREENWIDTH)
        return;
    if (row < 0) {
        height += row;
        row = 0;
    }
    if (row + height >= SCREENHEIGHT)
        height = SCREENHEIGHT - row;
    if (col < 0) {
        width += col;
        col = 0;
    }
    if (col + width >= SCREENWIDTH)
        width = SCREENWIDTH - col;
    if (height <= 0 || width <= 0 || row >= SCREENHEIGHT || col >= SCREENWIDTH)
        return;
    // TODO 5.0: Write this function using DMA
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int r = 0; r < height; r++) {
        // = odd column and even width
        //here the condition should be
        if ((col & 1) && !(width & 1)) {
            //take care of the middle part since its bigger than 2
            if (width > 2) {
                //odd column, so plus 1
                // DMANow(3, &pixelData, &videoBuffer[OFFSET(r + row, col + 1, SCREENWIDTH)/2], DMA_SOURCE_FIXED | (width/2));
                DMANow(3, &pixelData, &videoBuffer[OFFSET(r + row, col + 1, SCREENWIDTH)/2], DMA_SOURCE_FIXED | ((width/2)-1));
            }
            //take care of the edge column on the left, the right pixel of it
            setPixel4(row + r, col, colorIndex);
            //take care of the edge column on the right, but the left pixel of it
            setPixel4(row + r, col+width-1, colorIndex);
        }
        // = odd column and odd width
        //should be if (col & 1) && (width & 1)
        else if ((col & 1) && (width & 1)) {
            //if greater than 1, take care of the other double columns
            if (width > 1) {
                //odd column, so plus 1
                DMANow(3, &pixelData, &videoBuffer[OFFSET(r + row, col + 1, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
            }
            //take care of that single column
            setPixel4(row + r, col, colorIndex);

        }

        // = even column and odd width
        else if (!(col & 1) && (width & 1)) {
            //if its greater than 1, take care of the double column edge cases
            if (width > 1) {
                DMANow(3, &pixelData, &videoBuffer[OFFSET(r+row, col, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
            }
            //take care of the that single column
            setPixel4(row + r, col+width-1, colorIndex);
        }
        // = even column and even width
        else if ( !(col & 1) && !(width & 1) ) {
            //easiest fuckin case ffs
            DMANow(3, &pixelData, &videoBuffer[OFFSET(r+row, col, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
        }

    }
}


// Fill the entire screen with a single color in Mode 3
void fillScreen3(volatile unsigned short color) {

	DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

// Fill the entire screen with a single color in Mode 4
void fillScreen4(volatile unsigned char colorIndex) {

    // TODO 2.0: Write this function using DMA
    volatile unsigned short color = (colorIndex<<8) | colorIndex;
    DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT)/2);

}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int row, int col, int height, int width, const unsigned short *image) {
 // Paste this code at the beginning of drawRect3, drawRect4, drawImage3, and drawImage4
    if (height <= 0 || width <= 0 || row >= SCREENHEIGHT || col >= SCREENWIDTH)
        return;
    if (row < 0) {
        height += row;
        row = 0;
    }
    if (row + height >= SCREENHEIGHT)
        height = SCREENHEIGHT - row;
    if (col < 0) {
        width += col;
        col = 0;
    }
    if (col + width >= SCREENWIDTH)
        width = SCREENWIDTH - col;
    if (height <= 0 || width <= 0 || row >= SCREENHEIGHT || col >= SCREENWIDTH)
        return;
    for(int r = 0; r < height; r++)
    {
        DMANow(3, (unsigned short*)&image[OFFSET(r,0, width)], &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)], (width));
    }
}

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage4(int row, int col, int height, int width, const unsigned short *image) {
 // Paste this code at the beginning of drawRect3, drawRect4, drawImage3, and drawImage4
    if (height <= 0 || width <= 0 || row >= SCREENHEIGHT || col >= SCREENWIDTH)
        return;
    if (row < 0) {
        height += row;
        row = 0;
    }
    if (row + height >= SCREENHEIGHT)
        height = SCREENHEIGHT - row;
    if (col < 0) {
        width += col;
        col = 0;
    }
    if (col + width >= SCREENWIDTH)
        width = SCREENWIDTH - col;
    if (height <= 0 || width <= 0 || row >= SCREENHEIGHT || col >= SCREENWIDTH)
        return;    for(int r = 0; r < height; r++)
    {
        DMANow(3, (unsigned short*)&image[OFFSET(r,0,width)/2], &videoBuffer[OFFSET(row + r, col, SCREENWIDTH)/2], width/2);
    }
}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage4(const unsigned short *image) {

    DMANow(3, image, videoBuffer, (SCREENWIDTH * SCREENHEIGHT)/2);

}

// Pause code execution until vertical blank begins
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage() {

    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // Turn DMA off
    dma[channel].cnt = 0;

    // Set source and destination
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Set control and begin
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}