#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "sound.h"
#include "shoot.h"
#include "collision.h"

PLAYER player;
BULLET icon;
LIFE lives[LIFECOUNT];
BULLET bullet[BULLETCOUNT];
BULLET special[SPECIALB];
ENEMY1 enemy1[ENEMY1COUNT];
ENEMY1 enemy2[ENEMY2COUNT];
ENEMY1 enemy3[ENEMY3COUNT];
NUM hunds;
NUM tens;
NUM ones;
NUM thous;


// Initialize the game
void initGame() {
    //initially can only have a max of 10 on screen. 10 is a little much but i want to see if the player
    //.enemy1timer will curb the amount of enemies anyway
    //currently, these vars aren't being used
    maxEnemy1 = 5;
    enemy1onscrn = 0;
    //tracks which life you are on
    livesLeft = 3;
    score = 0;
    cheatcnt = 20;
    bulletReg = 35;
    initPlayer();
    initBullet();
    initLives();
    initEnemies1();
    initEnemies2();
    initEnemies3();
    initScoreOnes();
    initScoreTens();
    initScoreHunds();
    initScoreThous();
    initIcon();
    initSpecial();
}
void updateGame() {
    //UNCOMMENT
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
    if (icon.active) {
        updateIcon();
    }
    if(player.specialActive) {
        for (int i = 0; i < SPECIALB; i++) {
            if(special[i].active) {
                updateSpecial(&special[i]);
            }
        }

    }

}

void drawGame() {

    //sets up the players attributes
    shadowOAM[player.shadowoam].attr0 = (ROWMASK & player.row) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[player.shadowoam].attr1 = (COLMASK & player.col)| ATTR1_TINY;
    shadowOAM[player.shadowoam].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame, player.aniState*2);

    for (int j = 0; j < ENEMY1COUNT; j++) {
        if(enemy1[j].active) {
            shadowOAM[j+1].attr0 = (ROWMASK & enemy1[j].row) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[j+1].attr1 = (COLMASK & enemy1[j].col) | ATTR1_MEDIUM;
            shadowOAM[j+1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy1[j].curFrame*2, enemy1[j].aniState);
        }
    }

    for (int i = 0; i < BULLETCOUNT; i++) {
        if(bullet[i].active) {
            shadowOAM[i+21].attr0 = (ROWMASK & bullet[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[i+21].attr1 = (COLMASK & bullet[i].col) | ATTR1_TINY;
            shadowOAM[i+21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bullet[i].curFrame, bullet[i].aniState);
        }
    }
    for (int k = 0; k < LIFECOUNT; k++) {
        if(lives[k].active) {
            shadowOAM[k+31].attr0 = (ROWMASK & lives[k].row) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[k+31].attr1 = (COLMASK & lives[k].col) | ATTR1_TINY;
            shadowOAM[k+31].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(lives[k].curFrame, lives[k].aniState);
        }
    }
    for (int m = 0; m < ENEMY2COUNT; m++) {
        if(enemy2[m].active) {
            shadowOAM[m+35].attr0 = (ROWMASK & enemy2[m].row) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[m+35].attr1 = (COLMASK & enemy2[m].col) | ATTR1_SMALL;
            shadowOAM[m+35].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy2[m].curFrame*2, enemy2[m].aniState);
        }
    }
    for (int n = 0; n < ENEMY3COUNT; n++) {
        if(enemy3[n].active) {
            shadowOAM[n+55].attr0 = (ROWMASK & enemy3[n].row) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[n+55].attr1 = (COLMASK & enemy3[n].col) | ATTR1_MEDIUM;
            shadowOAM[n+55].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(enemy3[n].curFrame*2, enemy3[n].aniState);
        }
    }
    //code for ones place in score
    shadowOAM[ones.shadowoam].attr0 = (ROWMASK & ones.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[ones.shadowoam].attr1 = (COLMASK & ones.col)| ATTR1_TINY;
    shadowOAM[ones.shadowoam].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(ones.curFrame, ones.aniState);
    
    //code for tens place in score
    shadowOAM[tens.shadowoam].attr0 = (ROWMASK & tens.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[tens.shadowoam].attr1 = (COLMASK & tens.col)| ATTR1_TINY;
    shadowOAM[tens.shadowoam].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(tens.curFrame, tens.aniState);
    
    //code for hunds place in score
    shadowOAM[hunds.shadowoam].attr0 = (ROWMASK & hunds.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[hunds.shadowoam].attr1 = (COLMASK & hunds.col)| ATTR1_TINY;
    shadowOAM[hunds.shadowoam].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(hunds.curFrame, hunds.aniState);

    //code for thous place in score
    shadowOAM[thous.shadowoam].attr0 = (ROWMASK & thous.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[thous.shadowoam].attr1 = (COLMASK & thous.col)| ATTR1_TINY;
    shadowOAM[thous.shadowoam].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(thous.curFrame, thous.aniState);

    if (icon.active) {
        shadowOAM[icon.shadowoam].attr0 = (ROWMASK & icon.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[icon.shadowoam].attr1 = (COLMASK & icon.col)| ATTR1_TINY;
        shadowOAM[icon.shadowoam].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(icon.curFrame, icon.aniState);
    }
    for (int o = 0; o < SPECIALB; o++) {
        if(special[o].active) {
            shadowOAM[special[o].shadowoam].attr0 = (ROWMASK & special[o].row) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[special[o].shadowoam].attr1 = (COLMASK & special[o].col) | ATTR1_TINY;
            shadowOAM[special[o].shadowoam].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(special[o].curFrame, special[o].aniState);
        }
    }

    waitForVBlank();

}
void initPlayer() {
    player.width = 16;
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
    player.shadowoam = 0;
    player.specialActive = 0;
    player.specialCount = 0;
    player.aniState = PLAYERFRONT;
    player.collidedL = 0;
    player.collidedR = 0;
}

void updatePlayer() {
    player.enemy1Timer++;

    if(!player.hurt && (player.enemy1Timer % 20 == 0)) {
        player.curFrame++;
    }
    if(!player.hurt && player.curFrame == 3) {
        player.curFrame = 0;
    }

    if (BUTTON_HELD(BUTTON_LEFT) && (collisionBitmap[player.col])
        && player.col >= player.cdel) {

        player.col -= player.cdel;

        if(player.collidedR && (collisionBitmap[player.col + player.width])) {
            player.collidedR = 0;
        }

        if(!(collisionBitmap[player.col]) && !player.collidedL && !player.hurt) {
            player.collidedL = 1;
            player.hurt = 1;
            player.curFrame = 3;
            updateLives();
        }

    } else if (BUTTON_HELD(BUTTON_RIGHT) && (collisionBitmap[player.col + player.width])
        && player.col + player.width < SCREENWIDTH - player.cdel) {

        player.col += player.cdel;

        if(player.collidedL && (collisionBitmap[player.col])) {
            player.collidedL = 0;
        }

        if(!(collisionBitmap[player.col + player.width]) && !player.collidedR && !player.hurt) {
            player.collidedR = 1;
            player.hurt = 1;
            player.curFrame = 3;
            updateLives();
        }

    } else if (BUTTON_HELD(BUTTON_UP)
        && player.row >= player.rdel && !player.dead) {
        player.row -= player.rdel;

    } else if (BUTTON_HELD(BUTTON_DOWN)
        && player.row + player.height - 1 < SCREENHEIGHT - 15)  {

        player.row += player.rdel;
    }

    //fire a bullet when a pressed and then wait 30 frames till next fired
    if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= bulletReg) {
        player.bulletTimer = 0;
        playSoundB(shoot,SHOOTLEN,SHOOTFREQ, 0);
        if ((!player.specialActive)){
            fireBullet();
        } else if (player.specialActive) {
            fireSpecial();

            player.specialCount--;
            if(player.specialCount == 0) {
                player.specialActive = 0;
                hideSpecial();
                fireBullet();
            }

        }
    } 
    //increment the bullet timer each frame
    player.bulletTimer++;
    regulate();

    for (int i = 0; i < ENEMY1COUNT; i++) {
        if(enemy1[i].active && !player.hurt) {
            if (collision (enemy1[i].row, enemy1[i].col, enemy1[i].height, enemy1[i].width, 
                player.row, player.col, player.height, player.width)) {

                enemy1[i].active = 0;
                shadowOAM[enemy1[i].shadowoam].attr0 |= ATTR0_HIDE;
                player.hurt = 1;
                updateLives();
                player.curFrame = 3;
                break;
            }
        } 
    }
    for (int j = 0; j < ENEMY2COUNT; j++) {
        if(enemy2[j].active && !player.hurt) {
            if (collision (enemy2[j].row, enemy2[j].col, enemy2[j].height, enemy2[j].width, 
                player.row, player.col, player.height, player.width)) {

                enemy2[j].active = 0;
                shadowOAM[enemy2[j].shadowoam].attr0 |= ATTR0_HIDE;
                player.hurt = 1;
                updateLives();
                player.curFrame = 3;
                break;
            }
        } 
    }
    for (int j = 0; j < ENEMY3COUNT; j++) {
        if(enemy3[j].active && !player.hurt) {
            if (collision (enemy3[j].row, enemy3[j].col, enemy3[j].height, enemy3[j].width, 
                player.row, player.col, player.height, player.width)) {

                enemy3[j].active = 0;
                shadowOAM[enemy3[j].shadowoam].attr0 |= ATTR0_HIDE;
                player.hurt = 1;
                updateLives();
                player.curFrame = 3;
                break;
            }
        } 
    }
    if (player.hurt == 1) {
        player.hurtTimer++;
        if (player.curFrame < 6 && (player.enemy1Timer % 20 == 0)) {
            player.curFrame++;
        } else if (player.curFrame == 6){
            player.curFrame = 3;
        }
    }
    if (player.hurtTimer >= 100) {
        player.curFrame = 0;
        player.hurt = 0;
        player.hurtTimer = 0;
    }

}

void regulate() {
    //REGULATION
    //have an enemy timer to manage the number of enemies spawning on screen
    if (score < 15) {
        if ((player.enemy1Timer > 85) &&( player.enemy1Timer % 85 == 0)) {
            spawnEnemy1();
        }
        if ((player.enemy1Timer > 300) &&( player.enemy1Timer % 300 == 0)) {
            if (player.enemy2Active) {
                spawnEnemy2();
                // spawnEnemy3();
            }

        }
    } else if (score >= 15 && score < 35) {
        if (player.enemy1Timer % 75 == 0) {
            spawnEnemy1();
        } 
        if (( player.enemy1Timer % 275 == 0)) {
            if (player.enemy2Active) {
                spawnEnemy2();
            }
        }
    } else if (score >= 35 && score < 55) {
        if (player.enemy1Timer % 55 == 0) {
            spawnEnemy1();
        }
        if ((player.enemy1Timer > 200) &&( player.enemy1Timer % 200 == 0)) {
            if (player.enemy2Active) {
                spawnEnemy2();
            }
        }
    } else if (score >= 55 && score < 75) {
        if (player.enemy1Timer % 55 == 0) {
            spawnEnemy1();
        }
        if ((player.enemy1Timer > 200) &&( player.enemy1Timer % 150 == 0)) {
            if (player.enemy2Active) {
                spawnEnemy2();
            }
        }
        if ((player.enemy1Timer > 200) &&( player.enemy1Timer % 300 == 0)) {
            if (player.enemy3Active) {
                spawnEnemy3();
            }
        }
    } else if (score >= 75) {
        if (player.enemy1Timer % 55 == 0) {
            spawnEnemy1();
        }
        if ((player.enemy1Timer > 200) &&( player.enemy1Timer % 100 == 0)) {
            if (player.enemy2Active) {
                spawnEnemy2();
            }
        }
        if ((player.enemy1Timer > 200) &&( player.enemy1Timer % 275 == 0)) {
            if (player.enemy3Active) {
                spawnEnemy3();
            }
        }
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
        bullet[i].shadowoam = i + 21;
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
            bullet[i].curFrame = 0;
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
            shadowOAM[b->shadowoam].attr0 |= ATTR0_HIDE;
        }
    }
}
void initSpecial() {
    for (int i = 0; i < SPECIALB; i++) {
        special[i].row = player.row;
        special[i].col = player.col + player.width/2 - special[i].width/2;
        special[i].rdel = -2;
        special[i].height = 8;
        special[i].width = 8;
        special[i].active = 0;
        special[i].aniCounter = 0;
        special[i].curFrame = 0;
        special[i].numFrames = 1;
        special[i].shadowoam = i + 82;
        special[i].aniState = SPECIAL;

    }
}
void fireSpecial() {
    // Find the first inactive special, activate it and init it
    for (int i = 0; i < SPECIALB; i++) {
        if (!special[i].active) {
            special[i].active = 1;
            // Position the new special
            special[i].row = player.row;
            special[i].col = player.col + player.width/2
                - special[i].width/2;

            // Take the special out of the pool
            // special[i].curFrame = 1;

            // Break out of the loop
            break;
        }
    }
}
//move all active specials upward
void updateSpecial(BULLET* s) {

    // If active, update; otherwise ignore
    if (s->active) {
        if (s->row - 5 > 0) {
            s->row += s->rdel;

        } else {
            s->active = 0;
            s->curFrame = 0;
            shadowOAM[s->shadowoam].attr0 |= ATTR0_HIDE;
        }
    }
}

void initIcon() {
    icon.row = player.row;
    icon.col = player.col + player.width/2 - icon.width/2;
    icon.rdel = 1;
    icon.height = 8;
    icon.width = 8;
    icon.active = 0;
    icon.aniCounter = 0;
    icon.curFrame = 0;
    icon.numFrames = 1;
    icon.shadowoam = 82;
    icon.aniState = ICON;
}

void spawnIcon(int row, int col, int width, int height, int rdel)  {
    icon.active = 1;
    icon.row = row + (height/2);
    icon.col = col + (width/2);
    icon.rdel = rdel;
    updateIcon();
}

void updateIcon() {
    if(player.enemy1Timer % 2 == 0) {
        icon.row += icon.rdel;
    }
    if (collision (icon.row, icon.col, icon.height, icon.width, 
        player.row, player.col, player.height, player.width)) {

        icon.active = 0;
        shadowOAM[icon.shadowoam].attr0 |= ATTR0_HIDE;
        player.specialActive = 1;
        player.specialCount = 10;
    } 
    if (icon.row + icon.height >= SCREENHEIGHT - 10) {
        icon.active = 0;
        shadowOAM[icon.shadowoam].attr0 |= ATTR0_HIDE;
    }

}

//initialize all the enemies1 but don't activate them 
void initEnemies1() {
    for (int i = 0; i < ENEMY1COUNT; i++) {
        enemy1[i].row = 1;
        enemy1[i].col = abs(rand() % 230);
        enemy1[i].rdel = 1;
        enemy1[i].width = 32;
        enemy1[i].height = 16;
        enemy1[i].active = 0;
        enemy1[i].aniCounter = 0;
        
        enemy1[i].prevAniState = 0;
        enemy1[i].curFrame = 0;
        enemy1[i].numFrames = 3;
        enemy1[i].shadowoam = i + 1;
        enemy1[i].aniState = ENEMY_1;
        enemy1[i].special = 0;

    }
}
void spawnEnemy1() {
    // if ((enemy1onscrn < maxEnemy1)) {
    for (int i = 0; i < ENEMY1COUNT; i++) {
        if (!enemy1[i].active) {
            if(score == cheatcnt) {
                //20 || score == 40 || score == 60 || score == 80 ||score == 100) {
                enemy1[i].special = 1;
                // cheatcnt += 20;
            }
            if (score > cheatcnt) {
                cheatcnt += 20;
            }
            enemy1[i].row = -enemy1[i].height;
            enemy1[i].col = abs((rand() % 163)+24);
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
        // if(player.enemy1Timer > 2500) {
        //     e->rdel = 2;
        // }
        if (player.enemy1Timer % 2) {
            e->row += e->rdel;
        }
        if (player.enemy1Timer % 20 == 0) {
            e->curFrame++;
        }
        if(e->curFrame == 3 )
            e->curFrame = 0;
        if (e->row + e->height >= SCREENHEIGHT - 10) {
            e->active = 0;
            shadowOAM[e->shadowoam].attr0 |= ATTR0_HIDE;
            enemy1onscrn--;
        }
    }
    if (!player.specialActive) {
        for (int i = 0; i < BULLETCOUNT; i++) {
            if(bullet[i].active) {
                if (collision (bullet[i].row, bullet[i].col, bullet[i].height, bullet[i].width, e->row, e->col, e->height, e->width)) {
                    bullet[i].active = 0;
                    e->active = 0;
                    shadowOAM[e->shadowoam].attr0 |= ATTR0_HIDE;
                    shadowOAM[bullet[i].shadowoam].attr0 |= ATTR0_HIDE;
                    bullet[i].curFrame = 0;
                    enemy1onscrn--;
                    //REPLACE WITH A SPECIAL BULLET
                    if(e->special) {
                        spawnIcon(e->row,e->col,e->width,e->height, e->rdel);
                        e->special = 0;
                    }
                    e->aniState = ENEMY_1;
                    score += 1;
                    updateScore(1);
                }
            }
        }
    } else if (player.specialActive) {
        for (int i = 0; i < SPECIALB; i++) {
            if(special[i].active) {
                if (collision (special[i].row, special[i].col, special[i].height, special[i].width, e->row, e->col, e->height, e->width)) {
                    special[i].active = 0;
                    e->active = 0;
                    shadowOAM[e->shadowoam].attr0 |= ATTR0_HIDE;
                    shadowOAM[special[i].shadowoam].attr0 |= ATTR0_HIDE;
                    special[i].curFrame = 0;
                    enemy1onscrn--;
                    e->aniState = ENEMY_1;
                    score += 1;
                    updateScore(1);
                }
            }
        }
    }
}

void initEnemies2() {
    for (int i = 0; i < ENEMY2COUNT; i++) {
        enemy2[i].row = 1;
        enemy2[i].col = abs(rand() % 230);
        enemy2[i].rdel = 1;
        enemy2[i].width = 16;
        enemy2[i].height = 16;
        enemy2[i].active = 0;
        enemy2[i].hit = 2;
        enemy2[i].aniCounter = 0;
        enemy2[i].prevAniState = 0;
        enemy2[i].curFrame = 0;
        enemy2[i].numFrames = 3;
        enemy2[i].shadowoam = i +35;
        enemy2[i].aniState = ENEMY_2;

    }
}
void spawnEnemy2() {
    // if ((enemy2onscrn < maxenemy2)) {
    for (int i = 0; i < ENEMY2COUNT; i++) {
        if (!enemy2[i].active) {
            enemy2[i].row = -enemy2[i].height;
            enemy2[i].col = abs((rand() % 176)+24);
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
        // if(player.enemy1Timer > 3500) {
        //     e->rdel = 2;
        // }
        if (player.enemy1Timer % 2 && score < 100) {
            e->row += e->rdel;
        } else if (score > 50) {
            e->row += e->rdel;

        }
        if (player.enemy1Timer % 20 == 0) {
            e->curFrame++;
        }
        if(e->curFrame == 3 )
            e->curFrame = 0;
        if (e->row + e->height >= SCREENHEIGHT - 12) {
            e->active = 0;
            shadowOAM[e->shadowoam].attr0 |= ATTR0_HIDE;
            // enemy1onscrn--;
        }
    }
    if(!player.specialActive) {
        for (int i = 0; i < BULLETCOUNT; i++) {
            if(bullet[i].active) {
                if (collision (bullet[i].row, bullet[i].col, bullet[i].height, bullet[i].width, e->row, e->col, e->height, e->width)) {
                    if(e->hit <= 1) {
                        score += 2;
                        bullet[i].active = 0;
                        e->active = 0;
                        shadowOAM[e->shadowoam].attr0 |= ATTR0_HIDE;
                        shadowOAM[bullet[i].shadowoam].attr0 |= ATTR0_HIDE;
                        bullet[i].curFrame = 0;
                        updateScore(2);
                    } else if (e->hit >= 2){
                        bullet[i].active = 0;
                        shadowOAM[bullet[i].shadowoam].attr0 |= ATTR0_HIDE;
                        e->hit--;
                    }
                }
            }
        }
    } else if (player.specialActive) {
        for (int i = 0; i < SPECIALB; i++) {
            if (collision (special[i].row, special[i].col, special[i].height, special[i].width, e->row, e->col, e->height, e->width)) {
                score += 2;
                special[i].active = 0;
                e->active = 0;
                shadowOAM[e->shadowoam].attr0 |= ATTR0_HIDE;
                shadowOAM[special[i].shadowoam].attr0 |= ATTR0_HIDE;
                special[i].curFrame = 0;
                updateScore(2);
            }
        }
    }
}

void initEnemies3() {
    for (int i = 0; i < ENEMY3COUNT; i++) {
        enemy3[i].row = 1;
        enemy3[i].col = abs(rand() % 230);
        enemy3[i].rdel = 1;
        enemy3[i].width = 32;
        enemy3[i].height = 16;
        enemy3[i].active = 0;
        enemy3[i].hit = 3;
        enemy3[i].aniCounter = 0;
        enemy3[i].prevAniState = 0;
        enemy3[i].curFrame = 0;
        enemy3[i].numFrames = 3;
        enemy3[i].shadowoam = i + 55;
        enemy3[i].aniState = ENEMY_3;

    }
}
void spawnEnemy3() {
    // if ((enemy2onscrn < maxenemy2)) {
    for (int i = 0; i < ENEMY3COUNT; i++) {
        if (!enemy3[i].active) {
            enemy3[i].row = -enemy3[i].height;
            enemy3[i].col = abs((rand() % 166)+24);
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
        //UNCOMMENT
        // if(player.enemy1Timer > 2000) {
        //     e->rdel = 2;
        // }
        e->row += e->rdel;
        if (player.enemy1Timer % 20 == 0) {
            e->curFrame++;
        }
        if(e->curFrame == 3 )
            e->curFrame = 0;
        if (e->row + e->height >= SCREENHEIGHT - 12) {
            e->active = 0;
            shadowOAM[e->shadowoam].attr0 |= ATTR0_HIDE;
            // enemy1onscrn--;
        }
    }
    if(!player.specialActive) {
        for (int i = 0; i < BULLETCOUNT; i++) {
            if(bullet[i].active) {
                if (collision (bullet[i].row, bullet[i].col, bullet[i].height, bullet[i].width, e->row, e->col, e->height, e->width)) {
                    if(e->hit <= 1) {
                        score += 2;
                        bullet[i].active = 0;
                        e->active = 0;
                        shadowOAM[e->shadowoam].attr0 |= ATTR0_HIDE;
                        shadowOAM[bullet[i].shadowoam].attr0 |= ATTR0_HIDE;
                        bullet[i].curFrame = 0;
                        updateScore(2);
                    } else if (e->hit >= 2){
                        bullet[i].active = 0;
                        shadowOAM[bullet[i].shadowoam].attr0 |= ATTR0_HIDE;
                        e->hit--;
                    }
                }
            }
        }
    } else if (player.specialActive) {
        for (int i = 0; i < SPECIALB; i++) {
            if (collision (special[i].row, special[i].col, special[i].height, special[i].width, e->row, e->col, e->height, e->width)) {
                score += 2;
                special[i].active = 0;
                e->active = 0;
                shadowOAM[e->shadowoam].attr0 |= ATTR0_HIDE;
                shadowOAM[special[i].shadowoam].attr0 |= ATTR0_HIDE;
                special[i].curFrame = 0;
                updateScore(2);
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
        lives[i].shadowoam = i + 31;
        lives[i].aniState = LIVESPRITE;
        colStart += 10;
    }
}

void updateLives() {
    // playSoundB(shoot,SHOOTLEN,SHOOTFREQ, 0);
    lives[livesLeft - 1].active = 0;
    shadowOAM[(lives[livesLeft - 1]).shadowoam].attr0 |= ATTR0_HIDE;
    livesLeft--;
}

//============================================================================
//SCORES

void initScoreOnes() {
    ones.row = 150;
    ones.col = 48;
    ones.height = 8;
    ones.width = 8;
    ones.active = 1;
    ones.aniCounter = 0;
    ones.curFrame = 0;
    ones.numFrames = 9;
    ones.shadowoam = 78;
    ones.aniState = ONES;

}
void initScoreTens() {
    tens.row = 150;
    tens.col = 40;
    tens.height = 8;
    tens.width = 8;
    tens.active = 1;
    tens.aniCounter = 0;
    tens.curFrame = 0;
    tens.numFrames = 9;
    tens.shadowoam = 79;
    tens.aniState = TENS;
}
void initScoreHunds() {
    hunds.row = 150;
    hunds.col = 32;
    hunds.height = 8;
    hunds.width = 8;
    hunds.active = 1;
    hunds.aniCounter = 0;
    hunds.curFrame = 0;
    hunds.numFrames = 9;
    hunds.shadowoam = 80;
    hunds.aniState = HUNDS;
}
void initScoreThous() {
    thous.row = 150;
    thous.col = 24;
    thous.height = 8;
    thous.width = 8;
    thous.active = 1;
    thous.aniCounter = 0;
    thous.curFrame = 0;
    thous.numFrames = 9;
    thous.shadowoam = 81;
    thous.aniState = THOUS;
}
void updateScore(int enemy) {
    if (enemy == 1) {
        if(ones.curFrame < ones.numFrames) {
            ones.curFrame++;
        } else {
            ones.curFrame = 0;
            if(tens.curFrame < tens.numFrames) {
                tens.curFrame++;
            } else {
                tens.curFrame = 0;
                if(hunds.curFrame < hunds.numFrames) {
                    hunds.curFrame++;
                } else {
                    hunds.curFrame = 0;
                    if(thous.curFrame < thous.numFrames) {
                        thous.curFrame++;
                    } else {
                        thous.curFrame = 0;
                    }
                } 
            }
        }
    }
    else if (enemy == 2) {
        if(ones.curFrame < (ones.numFrames - 1)) {
            ones.curFrame += 2;
        } 
        else if (ones.curFrame == 8) {
            ones.curFrame = 0;
            if(tens.curFrame < tens.numFrames) {
                tens.curFrame++;
            } else {
                tens.curFrame = 0;
                if(hunds.curFrame < hunds.numFrames) {
                    hunds.curFrame++;
                } else {
                    hunds.curFrame = 0;
                    if(thous.curFrame < thous.numFrames) {
                        thous.curFrame++;
                    } else {
                        thous.curFrame = 0;
                    }
                } 
            }
        } else if (ones.curFrame == 9) {
            ones.curFrame = 1;
            if(tens.curFrame < tens.numFrames) {
                tens.curFrame++;
            } else {
                tens.curFrame = 0;
                if(hunds.curFrame < hunds.numFrames) {
                    hunds.curFrame++;
                } else {
                    hunds.curFrame = 0;
                    if(thous.curFrame < thous.numFrames) {
                        thous.curFrame++;
                    } else {
                        thous.curFrame = 0;
                    }
                } 
            }
        }

    } else if (enemy == 3) {
        if (ones.curFrame < 7) {
            ones.curFrame+=3; 
        } 
        else if (ones.curFrame == 7) {
            ones.curFrame = 0;
            if(tens.curFrame < tens.numFrames) {
                tens.curFrame++;
            } else {
                tens.curFrame = 0;
                if(hunds.curFrame < hunds.numFrames) {
                    hunds.curFrame++;
                } else {
                    hunds.curFrame = 0;
                    if(thous.curFrame < thous.numFrames) {
                        thous.curFrame++;
                    } else {
                        thous.curFrame = 0;
                    }
                } 
            }
        }
        else if (ones.curFrame == 8) {
            ones.curFrame = 1;
            if(tens.curFrame < tens.numFrames) {
                tens.curFrame++;
            } else {
                tens.curFrame = 0;
                if(hunds.curFrame < hunds.numFrames) {
                    hunds.curFrame++;
                } else {
                    hunds.curFrame = 0;
                    if(thous.curFrame < thous.numFrames) {
                        thous.curFrame++;
                    } else {
                        thous.curFrame = 0;
                    }
                } 
            }
        }
        else if (ones.curFrame == 9) {
            ones.curFrame = 2;
            if(tens.curFrame < tens.numFrames) {
                tens.curFrame++;
            } else {
                tens.curFrame = 0;
                if(hunds.curFrame < hunds.numFrames) {
                    hunds.curFrame++;
                } else {
                    hunds.curFrame = 0;
                    if(thous.curFrame < thous.numFrames) {
                        thous.curFrame++;
                    } else {
                        thous.curFrame = 0;
                    }
                } 
            }
        }
    }

}

//======================================================================
void hideSpecial() {
    for(int i = 0; i < SPECIALB; i++) {
        if(special[i].active) {
            special[i].active = 0;
            shadowOAM[special[i].shadowoam].attr0 |= ATTR0_HIDE;

        }
    }
}