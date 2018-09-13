# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 27 "myLib.h"
extern unsigned short *videoBuffer;
# 53 "myLib.h"
void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();
# 89 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 100 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 140 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "myLib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


void setPixel3(int row, int col, unsigned short color) {

 videoBuffer[((row)*(240)+(col))] = color;
}


void setPixel4(int row, int col, unsigned char colorIndex) {
    unsigned short pixelData =
        videoBuffer[((row)*(240)+(col))/2];
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= (colorIndex<<8);
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((row)*(240)+(col))/2] = pixelData;

}


void drawRect3(int row, int col, int height, int width, volatile unsigned short color) {

    if (height <= 0 || width <= 0 || row >= 160 || col >= 240)
        return;
    if (row < 0) {
        height += row;
        row = 0;
    }
    if (row + height >= 160)
        height = 160 - row;
    if (col < 0) {
        width += col;
        col = 0;
    }
    if (col + width >= 240)
        width = 240 - col;
    if (height <= 0 || width <= 0 || row >= 160 || col >= 240)
        return;
 for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col))], (2 << 23) | width);
 }
}


void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex) {

    if (height <= 0 || width <= 0 || row >= 160 || col >= 240)
        return;
    if (row < 0) {
        height += row;
        row = 0;
    }
    if (row + height >= 160)
        height = 160 - row;
    if (col < 0) {
        width += col;
        col = 0;
    }
    if (col + width >= 240)
        width = 240 - col;
    if (height <= 0 || width <= 0 || row >= 160 || col >= 240)
        return;

    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    for (int r = 0; r < height; r++) {


        if ((col & 1) && !(width & 1)) {

            if (width > 2) {


                DMANow(3, &pixelData, &videoBuffer[((r + row)*(240)+(col + 1))/2], (2 << 23) | ((width/2)-1));
            }

            setPixel4(row + r, col, colorIndex);

            setPixel4(row + r, col+width-1, colorIndex);
        }


        else if ((col & 1) && (width & 1)) {

            if (width > 1) {

                DMANow(3, &pixelData, &videoBuffer[((r + row)*(240)+(col + 1))/2], (2 << 23) | width/2);
            }

            setPixel4(row + r, col, colorIndex);

        }


        else if (!(col & 1) && (width & 1)) {

            if (width > 1) {
                DMANow(3, &pixelData, &videoBuffer[((r+row)*(240)+(col))/2], (2 << 23) | width/2);
            }

            setPixel4(row + r, col+width-1, colorIndex);
        }

        else if ( !(col & 1) && !(width & 1) ) {

            DMANow(3, &pixelData, &videoBuffer[((r+row)*(240)+(col))/2], (2 << 23) | width/2);
        }

    }
}



void fillScreen3(volatile unsigned short color) {

 DMANow(3, &color, videoBuffer, (2 << 23) | (240 * 160));
}


void fillScreen4(volatile unsigned char colorIndex) {


    volatile unsigned short color = (colorIndex<<8) | colorIndex;
    DMANow(3, &color, videoBuffer, (2 << 23) | (240 * 160)/2);

}


void drawImage3(int row, int col, int height, int width, const unsigned short *image) {

    if (height <= 0 || width <= 0 || row >= 160 || col >= 240)
        return;
    if (row < 0) {
        height += row;
        row = 0;
    }
    if (row + height >= 160)
        height = 160 - row;
    if (col < 0) {
        width += col;
        col = 0;
    }
    if (col + width >= 240)
        width = 240 - col;
    if (height <= 0 || width <= 0 || row >= 160 || col >= 240)
        return;
    for(int r = 0; r < height; r++)
    {
        DMANow(3, (unsigned short*)&image[((r)*(width)+(0))], &videoBuffer[((row+r)*(240)+(col))], (width));
    }
}


void drawImage4(int row, int col, int height, int width, const unsigned short *image) {

    if (height <= 0 || width <= 0 || row >= 160 || col >= 240)
        return;
    if (row < 0) {
        height += row;
        row = 0;
    }
    if (row + height >= 160)
        height = 160 - row;
    if (col < 0) {
        width += col;
        col = 0;
    }
    if (col + width >= 240)
        width = 240 - col;
    if (height <= 0 || width <= 0 || row >= 160 || col >= 240)
        return; for(int r = 0; r < height; r++)
    {
        DMANow(3, (unsigned short*)&image[((r)*(width)+(0))/2], &videoBuffer[((row + r)*(240)+(col))/2], width/2);
    }
}


void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, 240 * 160);
}


void drawFullscreenImage4(const unsigned short *image) {

    DMANow(3, image, videoBuffer, (240 * 160)/2);

}


void waitForVBlank() {

 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}


void flipPage() {

    if ((*(unsigned short *)0x4000000) & (1<<4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(unsigned short *)0x4000000) ^= (1<<4);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {


    dma[channel].cnt = 0;


    dma[channel].src = src;
    dma[channel].dst = dst;


    dma[channel].cnt = cnt | (1 << 31);
}


int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
