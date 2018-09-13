// Player Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	int color;
	int ballTimer;
} PLAYER;

// Ball Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BALL;


// Brick Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BRICK;

// Constants
#define BALLCOUNT 5
#define BRICKCOUNT 36
#define BRICKROWS 3
#define BRICKCOLS 6

// Variables
extern PLAYER player;
extern BALL balls[BALLCOUNT];
extern BRICK bricks[BRICKCOUNT];
extern int bricksRemaining;
extern int ballOOB;
extern int go;

// Prototypes
void initGame();
void updateGame();
void drawGame();
//player prototypes
void initPlayer();
void updatePlayer();
void drawPlayer();
// balls
void initBall();
void updateBall();
void drawBall();
//brick prototypes
void initBricks();
void updateBrick(BRICK *);
void drawBrick(BRICK *);