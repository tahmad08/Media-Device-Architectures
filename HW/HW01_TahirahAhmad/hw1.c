#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)
#define COLOR(r,g,b) ((r) | ((g)<<5) | ((b)<<10))
#define OFFSET(r,c,rowlength) ((r) * (rowlength) + (c))

#define RED COLOR(31, 0, 0)
#define LIGHTPURPLE COLOR(25,10,31)
#define PINK COLOR(31,10,16)
#define GRAY COLOR(16,16,16)
#define BLUE COLOR(0, 0, 31)
#define LIGHTBLUE COLOR(16,16,31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)
unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int, int, unsigned short);
void delay(int );
void drawHalfEyes(int, int, unsigned short);
void drawFullEyes(int, unsigned short);
void halfEye(int, int, int, unsigned short);
void fullEye(int, int, int, unsigned short);
void drawClosedEyes(unsigned short);
void drawEyeLiner(int, int, unsigned short);
void closedCycle(int, unsigned short);
void halfCycle(int, unsigned short);
void fullCycle(int, unsigned short);

int main() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    while (1) {

        closedCycle(6, LIGHTBLUE);
        closedCycle(1, BLACK);

        halfCycle(6, LIGHTBLUE);
        halfCycle(1, BLACK);

        fullCycle(9, LIGHTBLUE);
        fullCycle(1, BLACK);

        halfCycle(6, LIGHTBLUE);
        halfCycle(1, BLACK);

        closedCycle(6, LIGHTPURPLE);
        closedCycle(1, BLACK);

        halfCycle(6, LIGHTPURPLE);
        halfCycle(1, BLACK);

        fullCycle(9, LIGHTPURPLE);
        fullCycle(1, BLACK);

        halfCycle(6, LIGHTPURPLE);
        halfCycle(1, BLACK);

        closedCycle(6, PINK);
        closedCycle(1, BLACK);

        halfCycle(6, PINK);
        halfCycle(1, BLACK);

        fullCycle(9, PINK);
        fullCycle(1, BLACK);

        halfCycle(6, PINK);
        halfCycle(1, BLACK);

    }

}

void fullCycle(int time, unsigned short color) {
    drawFullEyes(70, color);
    drawEyeLiner(70, 47, color);
    drawEyeLiner(70, 192, color);
    delay(time);
}

void halfCycle(int time, unsigned short color) {
    drawHalfEyes(70, 52, color);
    drawEyeLiner(70, 47, color);
    drawEyeLiner(70, 192, color);
    delay(time);
}
void closedCycle(int time, unsigned short color) {
    drawClosedEyes(color);
    drawEyeLiner(70, 47, color);
    drawEyeLiner(70, 192, color);
    delay(time);
}


void drawEyeLiner(int row, int col, unsigned short color)
{
    for (int c = 0; c < 5; c++) {
        setPixel(row, col + c, color);
    }
}

void drawFullEyes(int row, unsigned short color) {
    fullEye(row, 77, 25, color);
    fullEye(row, 167, 25, color);
    for (int i = 10; i < 15; i++) {
        fullEye(70, 77, i, color);
    }
    for (int i = 10; i < 15; i++) {
        fullEye(70, 167, i, color);
    }
    for (int i = 1; i < 5; i++) {
        fullEye(70, 77, i, color);
    }
    for (int i = 1; i < 5; i++) {
        fullEye(70, 167, i, color);
    }
}

void fullEye(int xc, int yc, int r, unsigned short color)
{
    int rowVar = r;
    int colVar = 0;

    setPixel(rowVar + xc, colVar + yc, color);

    if (r > 0)
    {
        setPixel(rowVar + xc, -colVar + yc, color);
        setPixel(colVar + xc, rowVar + yc, color);
        setPixel(-colVar + xc, rowVar + yc, color);
    }

    int perimeter = 1 - r;
    while (rowVar > colVar)
    {
        colVar++;

        if (perimeter <= 0)
            perimeter = perimeter + 2*colVar + 1;

        else
        {
            rowVar--;
            perimeter = perimeter + 2*colVar - 2*rowVar + 1;
        }

        if (rowVar < colVar)
            break;

        setPixel(rowVar + xc, colVar + yc, color);
        setPixel(-rowVar + xc, colVar + yc, color);
        setPixel(rowVar + xc, -colVar + yc, color);
        setPixel(-rowVar + xc, -colVar + yc, color);


        if (rowVar != colVar)
        {
            setPixel(colVar + xc, rowVar + yc, color);
            setPixel(-colVar + xc, rowVar + yc, color);
            setPixel(colVar + xc, -rowVar + yc, color);
            setPixel(-colVar + xc, -rowVar + yc, color);
        }
    }
}

void drawHalfEyes(int row, int col, unsigned short color) {

    for (int i = 0; i < 50; i++) {
        setPixel(row, i + col, color);
    }

    for (int j = 90; j < 140; j++) {
        setPixel(row, j + col, color);
    }
    halfEye(70, 77, 25, color);
    halfEye(70, 167, 25, color);
    for (int i = 10; i < 15; i++) {
        halfEye(70, 77, i, color);
    }
    for (int i = 10; i < 15; i++) {
        halfEye(70, 167, i, color);
    }
    for (int i = 1; i < 5; i++) {
        halfEye(70, 77, i, color);
    }
    for (int i = 1; i < 5; i++) {
        halfEye(70, 167, i, color);
    }
}

void halfEye(int xc, int yc, int r, unsigned short color)
{
    int rowVar = r;
    int colVar = 0;

    setPixel(rowVar + xc, colVar + yc, color);

    if (r > 0)
    {
        setPixel(rowVar + xc, -colVar + yc, color);
        setPixel(colVar + xc, rowVar + yc, color);
        setPixel(-colVar + xc, rowVar + yc, color);
    }

    int perimeter = 1 - r;
    while (rowVar > colVar)
    {
        colVar++;

        if (perimeter <= 0)
            perimeter = perimeter + 2*colVar + 1;

        else
        {
            rowVar--;
            perimeter = perimeter + 2*colVar - 2*rowVar + 1;
        }

        if (rowVar < colVar)
            break;

        setPixel(rowVar + xc, colVar + yc, color);
        setPixel(rowVar + xc, -colVar + yc, color);


        if (rowVar != colVar)
        {
            setPixel(colVar + xc, rowVar + yc, color);
            setPixel(colVar + xc, -rowVar + yc, color);
        }
    }
}

void drawClosedEyes(unsigned short color) {
    halfEye(70, 77, 25, color);
    halfEye(70, 167, 25, color);
}

void setPixel(int row, int col, unsigned short color) {
    videoBuffer[OFFSET(row,col,240)] = color;
}
void delay(int amount) {
    int i;
    volatile int b;
    for(i=0;i < amount * 20000;i++) {
        b++;
    }
}
