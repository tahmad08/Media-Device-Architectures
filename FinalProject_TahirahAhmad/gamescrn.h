
//{{BLOCK(gamescrn)

//======================================================================
//
//	gamescrn, 256x512@8, 
//	+ palette 256 entries, not compressed
//	+ 44 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 2816 + 4096 = 7424
//
//	Time-stamp: 2018-04-15, 23:12:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCRN_H
#define GRIT_GAMESCRN_H

#define gamescrnTilesLen 2816
extern const unsigned short gamescrnTiles[1408];

#define gamescrnMapLen 4096
extern const unsigned short gamescrnMap[2048];

#define gamescrnPalLen 512
extern const unsigned short gamescrnPal[256];

#endif // GRIT_GAMESCRN_H

//}}BLOCK(gamescrn)
