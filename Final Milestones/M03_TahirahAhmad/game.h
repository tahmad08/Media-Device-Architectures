//player struct
typedef struct {
    int row;
    int col;
    int cdel;
    int rdel;
    int width;
    int height;
    int hurt;
    int hurtTimer;
    int dead;
    int bulletTimer;
    int aniCounter;
    int enemy1Timer;
    int enemy2Active;
    int enemy3Active;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int shadowOam;
} PLAYER;

//Enemy1 type struct
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int active;
    int hit;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int shadowOam;

} ENEMY1;


//bullet struct
typedef struct {
    int row;
    int col;
    int rdel;
    int height;
    int width;
    int active;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
    int shadowOam;

} BULLET;



//struct for lives sprites
typedef struct {
    int row;
    int col;
    int height;
    int width;
    int active;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
    int shadowOam;

} LIFE;


// States for the sprites variable
enum {PLAYERFRONT, EMPTY, ENEMY_3, ENEMY_2, ENEMY_1, BLLTSPRT, LIVESPRITE};


// Constants
#define ENEMY1COUNT 20
#define ENEMY2COUNT 20
#define ENEMY3COUNT 20
#define BULLETCOUNT 10
#define LIFECOUNT 4

// Variables
volatile int livesLeft;
//this int is going to be the max number of enemy 1 types on screen. after a certain period of time, the number will increase to increase difficulty
volatile int maxEnemy1;
//counts number of active enemies currently
volatile int enemy1onscrn;
//shadowOAM setup
volatile int score;
OBJ_ATTR shadowOAM[128];

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();

void initBullet();
void fireBullet();
void updateBullet(BULLET *);

//initialize values for the enemies
void initEnemies1();

void initLives();
void updateLives();

void spawnEnemy1();
void updateEnemy1(ENEMY1 *);

void initEnemies2();
void spawnEnemy2();
void updateEnemy2(ENEMY1 *);

void initEnemies3();
void spawnEnemy3();
void updateEnemy3(ENEMY1 *);