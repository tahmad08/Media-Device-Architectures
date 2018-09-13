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
	int bulletTimer;
} PLAYER;

// Bullet Struct
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
} BULLET;


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
#define BULLETCOUNT 5
#define BRICKCOUNT 35
#define BRICKROWS 3
#define BRICKCOLS 6

// Variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern BRICK bricks[BRICKCOUNT];
extern int bricksRemaining;
extern int bulletOOB;
extern int go;

// Prototypes
void initGame();
void updateGame();
void drawGame();
//player prototypes
void initPlayer();
void updatePlayer();
void drawPlayer();
// bullets
void initBullet();
void updateBullet();
void drawBullet();
//brick prototypes
void initBricks();
void updateBrick(BRICK *);
void drawBrick(BRICK *);