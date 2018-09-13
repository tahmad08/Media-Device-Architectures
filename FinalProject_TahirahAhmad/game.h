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
    int shadowoam;
    int specialActive;
    int specialCount;
    int collidedL;
    int collidedR;
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
    int shadowoam;
    int special;

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
    int shadowoam;

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
    int shadowoam;

} LIFE;

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
    int shadowoam;

} NUM;

// States for the sprites variable
enum {PLAYERFRONT,PLAYERFRONT2, ENEMY_1,ENEMY_12,ENEMY_13,ENEMY_14,ENEMY_2, ENEMY_22, THOUS, HUNDS, TENS, ONES,
    LIVESPRITE, BLLTSPRT, ICON, SPECIAL, ENEMY_3
};


// Constants
#define ENEMY1COUNT 20
#define ENEMY2COUNT 20
#define ENEMY3COUNT 20
#define BULLETCOUNT 10
#define SPECIALB 2
#define LIFECOUNT 3
#define NUMCOUNT 10

// Variables
volatile int livesLeft;
//this int is going to be the max number of enemy 1 types on screen. after a certain period of time, the number will increase to increase difficulty
volatile int maxEnemy1;
//counts number of active enemies currently
volatile int enemy1onscrn;
//shadowOAM setup
volatile int score;
int cheatEnemy;
int cheatcnt;
int bulletReg;
int spE1;
int spE2;
int spE3;

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
void initLives();
void updateLives();

void initEnemies1();
void spawnEnemy1();
void updateEnemy1(ENEMY1 *);

void initEnemies2();
void spawnEnemy2();
void updateEnemy2(ENEMY1 *);

void initEnemies3();
void spawnEnemy3();
void updateEnemy3(ENEMY1 *);

void initScoreOnes();
void initScoreTens();
void initScoreHunds();
void initScoreThous();
void updateScore(int);

void initTimer();
void regulate();

void initSpecial();
void initIcon();
void spawnIcon(int, int, int, int, int);
void updateIcon();
void fireSpecial();
void updateSpecial(BULLET *);
void hideSpecial();