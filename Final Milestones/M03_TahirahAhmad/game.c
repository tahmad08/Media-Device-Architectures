#include <stdlib.h>
#include "myLib.h"
#include "game.h"

PLAYER player;
LIFE lives[LIFECOUNT];
BULLET bullet[BULLETCOUNT];
ENEMY1 enemy1[ENEMY1COUNT];
ENEMY1 enemy2[ENEMY2COUNT];
ENEMY1 enemy3[ENEMY3COUNT];


// Initialize the game
void initGame() {
    //initially can only have a max of 10 on screen. 10 is a little much but i want to see if the player
    //.enemy1timer will curb the amount of enemies anyway
    //currently, these vars aren't being used
    maxEnemy1 = 5;
    enemy1onscrn = 0;
    //tracks which life you are on
    livesLeft = 4;
    score = 0;
    // // Set up Background 0
    initPlayer();
    initBullet();
    initLives();
    initEnemies1();
    initEnemies2();
    initEnemies3();
}
void updateGame() {
    if (player.enemy1Timer > 1000) {
        player.enemy2Active = 1;
    }
    if (player.enemy1Timer > 2000) {
        player.enemy3Active = 1;
    }
    updatePlayer();
    for (int i = 0; i < BULLETCOUNT; i++) {
        updateBullet(&bullet[i]);
    }
    for (int i = 0; i < ENEMY1COUNT; i++) {
        if (enemy1[i].active)
            updateEnemy1(&enemy1[i]);
    }
    if (player.enemy2Active) {
        for (int i = 0; i < ENEMY2COUNT; i++) {
            if (enemy2[i].active)
                updateEnemy2(&enemy2[i]);
        }
    }
    
    if (player.enemy3Active) {
        for (int i = 0; i < ENEMY3COUNT; i++) {
            if (enemy3[i].active)
                updateEnemy3(&enemy3[i]);
        }
    }

}

void drawGame() {

    //sets up the players attributes
    shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.col | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame, player.aniState);

    for (int j = 0; j < ENEMY1COUNT; j++) {
        if(enemy1[j].active) {
            shadowOAM[j+1].attr0 = enemy1[j].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[j+1].attr1 = enemy1[j].col | ATTR1_TINY;
            shadowOAM[j+1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy1[j].curFrame, enemy1[j].aniState);
        }
    }

    for (int i = 0; i < BULLETCOUNT; i++) {
        if(bullet[i].active) {
            shadowOAM[i+21].attr0 = bullet[i].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i+21].attr1 = bullet[i].col | ATTR1_TINY;
            shadowOAM[i+21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bullet[i].curFrame, bullet[i].aniState);
        }
    }
    for (int k = 0; k < LIFECOUNT; k++) {
        if(lives[k].active) {
            shadowOAM[k+31].attr0 = lives[k].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[k+31].attr1 = lives[k].col | ATTR1_TINY;
            shadowOAM[k+31].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(lives[k].curFrame, lives[k].aniState);
        }
    }
    for (int m = 0; m < ENEMY2COUNT; m++) {
        if(enemy2[m].active) {
            shadowOAM[m+35].attr0 = enemy2[m].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[m+35].attr1 = enemy2[m].col | ATTR1_TINY;
            shadowOAM[m+35].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy2[m].curFrame, enemy2[m].aniState);
        }
    }
    for (int n = 0; n < ENEMY3COUNT; n++) {
        if(enemy3[n].active) {
            shadowOAM[n+55].attr0 = enemy3[n].row | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[n+55].attr1 = enemy3[n].col | ATTR1_TINY;
            shadowOAM[n+55].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy3[n].curFrame, enemy3[n].aniState);
        }
    }
    waitForVBlank();

}
void initPlayer() {
    player.width = 8;
    player.height = 8;
    player.cdel = 2;
    player.rdel = 2;
    player.row = 125;
    player.col = 118;
    player.hurt = 0;
    player.hurtTimer = 0;
    player.dead = 0;
    player.bulletTimer = 20;
    player.aniCounter = 0;
    player.enemy1Timer = 0;
    player.enemy2Active = 0;
    player.enemy3Active = 0;
    player.curFrame = 0;
    player.numFrames = 1;
    player.shadowOam = 0;
    player.aniState = PLAYERFRONT;
}

void updatePlayer() {
    if (BUTTON_HELD(BUTTON_LEFT)
        && player.col >= player.cdel) {

        player.col -= player.cdel;

    } else if (BUTTON_HELD(BUTTON_RIGHT)
        && player.col + player.width < SCREENWIDTH - player.cdel) {

        player.col += player.cdel;

    } else if (BUTTON_HELD(BUTTON_UP)
        && player.row >= player.rdel && !player.dead) {
        player.row -= player.rdel;

    } else if (BUTTON_HELD(BUTTON_DOWN)
        && player.row + player.height - 1 < SCREENHEIGHT - 12)  {

        player.row += player.rdel;
    }

    //fire a bullet when a pressed and then wait 30 frames till next fired
    if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 25) {
        fireBullet();
        player.bulletTimer = 0;
    }
    //increment the bullet timer each frame
    player.bulletTimer++;

    //have an enemy timer to manage the number of enemies spawning on screen
    if (player.enemy1Timer % 20 == 0) {
        spawnEnemy1();
        if (player.enemy2Active) {
            spawnEnemy2();
        }
        if(player.enemy3Active) {
            spawnEnemy3();
        }
    }
    player.enemy1Timer++;

    for (int i = 0; i < ENEMY1COUNT; i++) {
        if(enemy1[i].active && !player.hurt) {
            if (collision (enemy1[i].row, enemy1[i].col, enemy1[i].height, enemy1[i].width, 
                player.row, player.col, player.height, player.width)) {

                enemy1[i].active = 0;
                shadowOAM[enemy1[i].shadowOam].attr0 |= ATTR0_HIDE;
                player.hurt = 1;
                updateLives();
                player.curFrame = 1;
                break;
            }
        } 
    }
    for (int j = 0; j < ENEMY2COUNT; j++) {
        if(enemy2[j].active && !player.hurt) {
            if (collision (enemy2[j].row, enemy2[j].col, enemy2[j].height, enemy2[j].width, 
                player.row, player.col, player.height, player.width)) {

                enemy2[j].active = 0;
                shadowOAM[enemy2[j].shadowOam].attr0 |= ATTR0_HIDE;
                player.hurt = 1;
                updateLives();
                player.curFrame = 1;
                break;
            }
        } 
    }
    if (player.hurt == 1) {
        player.hurtTimer++;
    }
    if (player.hurtTimer >= 100) {
        player.curFrame = 0;
        player.hurt = 0;
        player.hurtTimer = 0;
    }

}

void initBullet() {

    for (int i = 0; i < BULLETCOUNT; i++) {
        bullet[i].row = player.row;
        bullet[i].col = player.col + player.width/2 - bullet[i].width/2;
        bullet[i].rdel = -2;
        bullet[i].height = 8;
        bullet[i].width = 8;
        bullet[i].active = 0;
        bullet[i].aniCounter = 0;
        bullet[i].curFrame = 0;
        bullet[i].numFrames = 1;
        bullet[i].shadowOam = i + 21;
        bullet[i].aniState = BLLTSPRT;

    }
}

void fireBullet() {
    // Find the first inactive bullet, activate it and init it
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullet[i].active) {

            // Position the new bullet
            bullet[i].row = player.row;
            bullet[i].col = player.col + player.width/2
                - bullet[i].width/2;

            // Take the bullet out of the pool
            bullet[i].curFrame = 1;
            bullet[i].active = 1;

            // Break out of the loop
            break;
        }
    }
}
//move all active bullets upward
void updateBullet(BULLET* b) {

    // If active, update; otherwise ignore
    if (b->active) {
        if (b->row - 5 > 0) {
            b->row += b->rdel;

        } else {
            b->active = 0;
            b->curFrame = 0;
            shadowOAM[b->shadowOam].attr0 |= ATTR0_HIDE;
        }
    }
}

//initialize all the enemies1 but don't activate them 
void initEnemies1() {
    for (int i = 0; i < ENEMY1COUNT; i++) {
        enemy1[i].row = 1;
        enemy1[i].col = abs(rand() % 230);
        enemy1[i].rdel = 1;
        enemy1[i].width = 8;
        enemy1[i].height = 8;
        enemy1[i].active = 0;
        enemy1[i].aniCounter = 0;
        enemy1[i].prevAniState = 0;
        enemy1[i].curFrame = 0;
        enemy1[i].numFrames = 1;
        enemy1[i].shadowOam = i + 1;
        enemy1[i].aniState = ENEMY_1;

    }
}
void spawnEnemy1() {
    // if ((enemy1onscrn < maxEnemy1)) {
    for (int i = 0; i < ENEMY1COUNT; i++) {
        if (!enemy1[i].active) {
            enemy1[i].row = 1;
            // int col = abs((rand() % 210)+20);
            enemy1[i].col = abs(rand()%230);
            enemy1[i].active = 1;
            enemy1onscrn++;
            break;
        }
    }
    //}
}
void updateEnemy1(ENEMY1 *e) {
    // If active, update; otherwise ignore
    if (e->active) {
        if(player.enemy1Timer > 2500) {
            e->rdel = 2;
        }
        e->row += e->rdel;
        if (player.enemy1Timer % 40 == 0) {
            e->curFrame++;
        }
        if(e->curFrame == 2 )
            e->curFrame = 0;
        if (e->row + e->height >= SCREENHEIGHT - 12) {
            e->active = 0;
            shadowOAM[e->shadowOam].attr0 |= ATTR0_HIDE;
            enemy1onscrn--;
        }
    }
    for (int i = 0; i < BULLETCOUNT; i++) {
        if(bullet[i].active) {
            if (collision (bullet[i].row, bullet[i].col, bullet[i].height, bullet[i].width, e->row, e->col, e->height, e->width)) {
                score += 5;
                bullet[i].active = 0;
                e->active = 0;
                shadowOAM[e->shadowOam].attr0 |= ATTR0_HIDE;
                shadowOAM[bullet[i].shadowOam].attr0 |= ATTR0_HIDE;
                bullet[i].curFrame = 0;
                enemy1onscrn--;
                e->aniState = ENEMY_1;
            }
        }
    }
}

void initEnemies2() {
    for (int i = 0; i < ENEMY2COUNT; i++) {
        enemy2[i].row = 1;
        enemy2[i].col = abs(rand() % 230);
        enemy2[i].rdel = 1;
        enemy2[i].width = 8;
        enemy2[i].height = 8;
        enemy2[i].active = 0;
        enemy2[i].hit = 2;
        enemy2[i].aniCounter = 0;
        enemy2[i].prevAniState = 0;
        enemy2[i].curFrame = 0;
        enemy2[i].numFrames = 1;
        enemy2[i].shadowOam = i +35;
        enemy2[i].aniState = ENEMY_2;

    }
}
void spawnEnemy2() {
    // if ((enemy2onscrn < maxenemy2)) {
    for (int i = 0; i < ENEMY2COUNT; i++) {
        if (!enemy2[i].active) {
            enemy2[i].row = 1;
            enemy2[i].col = abs(rand()%230);
            enemy2[i].active = 1;
            enemy2[i].hit = 2;
            break;
        }
    }
    //}
}
void updateEnemy2(ENEMY1 *e) {
    // If active, update; otherwise ignore
    if (e->active) {
        if(player.enemy1Timer > 3500) {
            e->rdel = 2;
        }
        e->row += e->rdel;
        if (player.enemy1Timer % 40 == 0) {
            e->curFrame++;
        }
        if(e->curFrame == 2 )
            e->curFrame = 0;
        if (e->row + e->height >= SCREENHEIGHT - 12) {
            e->active = 0;
            shadowOAM[e->shadowOam].attr0 |= ATTR0_HIDE;
            // enemy1onscrn--;
        }
    }
    for (int i = 0; i < BULLETCOUNT; i++) {
        if(bullet[i].active) {
            if (collision (bullet[i].row, bullet[i].col, bullet[i].height, bullet[i].width, e->row, e->col, e->height, e->width)) {
                if(e->hit <= 1) {
                    score += 10;
                    bullet[i].active = 0;
                    e->active = 0;
                    shadowOAM[e->shadowOam].attr0 |= ATTR0_HIDE;
                    shadowOAM[bullet[i].shadowOam].attr0 |= ATTR0_HIDE;
                    bullet[i].curFrame = 0;
                } else if (e->hit >= 2){
                    bullet[i].active = 0;
                    shadowOAM[bullet[i].shadowOam].attr0 |= ATTR0_HIDE;
                    e->hit--;
                }

            }
        }
    }
}

void initEnemies3() {
    for (int i = 0; i < ENEMY3COUNT; i++) {
        enemy3[i].row = 1;
        enemy3[i].col = abs(rand() % 230);
        enemy3[i].rdel = 1;
        enemy3[i].width = 8;
        enemy3[i].height = 8;
        enemy3[i].active = 0;
        enemy3[i].hit = 3;
        enemy3[i].aniCounter = 0;
        enemy3[i].prevAniState = 0;
        enemy3[i].curFrame = 0;
        enemy3[i].numFrames = 1;
        enemy3[i].shadowOam = i + 55;
        enemy3[i].aniState = ENEMY_3;

    }
}
void spawnEnemy3() {
    // if ((enemy2onscrn < maxenemy2)) {
    for (int i = 0; i < ENEMY3COUNT; i++) {
        if (!enemy3[i].active) {
            enemy3[i].row = 1;
            enemy3[i].col = abs(rand()%230);
            enemy3[i].active = 1;
            enemy3[i].hit = 3;
            break;
        }
    }
    //}
}
void updateEnemy3(ENEMY1 *e) {
    // If active, update; otherwise ignore
    if (e->active) {
        // if(player.enemy1Timer > 2000) {
        //     e->rdel = 2;
        // }
        e->row += e->rdel;
        if (player.enemy1Timer % 40 == 0) {
            e->curFrame++;
        }
        if(e->curFrame == 2 )
            e->curFrame = 0;
        if (e->row + e->height >= SCREENHEIGHT - 12) {
            e->active = 0;
            shadowOAM[e->shadowOam].attr0 |= ATTR0_HIDE;
            // enemy1onscrn--;
        }
    }
    for (int i = 0; i < BULLETCOUNT; i++) {
        if(bullet[i].active) {
            if (collision (bullet[i].row, bullet[i].col, bullet[i].height, bullet[i].width, e->row, e->col, e->height, e->width)) {
                if(e->hit <= 1) {
                    score += 20;
                    bullet[i].active = 0;
                    e->active = 0;
                    shadowOAM[e->shadowOam].attr0 |= ATTR0_HIDE;
                    shadowOAM[bullet[i].shadowOam].attr0 |= ATTR0_HIDE;
                    bullet[i].curFrame = 0;
                } else if (e->hit > 1){
                    bullet[i].active = 0;
                    shadowOAM[bullet[i].shadowOam].attr0 |= ATTR0_HIDE;
                    e->hit--;
                }
                //enemy1onscrn--;
                //e->aniState = ENEMY_1;
            }
        }
    }
}
void initLives() {
    int colStart = 190;
    for (int i = 0; i < LIFECOUNT; i++) {
        lives[i].row = 150;
        lives[i].col = colStart;
        lives[i].height = 8;
        lives[i].width = 8;
        lives[i].active = 1;
        lives[i].aniCounter = 0;
        lives[i].curFrame = 0;
        lives[i].numFrames = 1;
        lives[i].shadowOam = i + 31;
        lives[i].aniState = LIVESPRITE;
        colStart += 10;

    }
}

void updateLives() {
    lives[livesLeft - 1].active = 0;
    shadowOAM[(lives[livesLeft - 1]).shadowOam].attr0 |= ATTR0_HIDE;
    livesLeft--;
}


