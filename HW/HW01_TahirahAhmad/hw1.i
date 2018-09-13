# 1 "hw1.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hw1.c"
# 17 "hw1.c"
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
    (*(unsigned short *)0x4000000) = 3 | (1<<10);

    while (1) {

        closedCycle(6, ((16) | ((16)<<5) | ((31)<<10)));
        closedCycle(1, 0);

        halfCycle(6, ((16) | ((16)<<5) | ((31)<<10)));
        halfCycle(1, 0);

        fullCycle(9, ((16) | ((16)<<5) | ((31)<<10)));
        fullCycle(1, 0);

        halfCycle(6, ((16) | ((16)<<5) | ((31)<<10)));
        halfCycle(1, 0);

        closedCycle(6, ((25) | ((10)<<5) | ((31)<<10)));
        closedCycle(1, 0);

        halfCycle(6, ((25) | ((10)<<5) | ((31)<<10)));
        halfCycle(1, 0);

        fullCycle(9, ((25) | ((10)<<5) | ((31)<<10)));
        fullCycle(1, 0);

        halfCycle(6, ((25) | ((10)<<5) | ((31)<<10)));
        halfCycle(1, 0);

        closedCycle(6, ((31) | ((10)<<5) | ((16)<<10)));
        closedCycle(1, 0);

        halfCycle(6, ((31) | ((10)<<5) | ((16)<<10)));
        halfCycle(1, 0);

        fullCycle(9, ((31) | ((10)<<5) | ((16)<<10)));
        fullCycle(1, 0);

        halfCycle(6, ((31) | ((10)<<5) | ((16)<<10)));
        halfCycle(1, 0);

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
    videoBuffer[((row) * (240) + (col))] = color;
}
void delay(int amount) {
    int i;
    volatile int b;
    for(i=0;i < amount * 20000;i++) {
        b++;
    }
}
