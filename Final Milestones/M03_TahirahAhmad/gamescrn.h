
//{{BLOCK(gamescrn)

//======================================================================
//
//	gamescrn, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 44 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 1408 + 4096 = 6016
//
//	Time-stamp: 2018-04-04, 18:50:13
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCRN_H
#define GRIT_GAMESCRN_H

#define gamescrnTilesLen 1408
extern const unsigned short gamescrnTiles[704];

#define gamescrnMapLen 4096
extern const unsigned short gamescrnMap[2048];

#define gamescrnPalLen 512
extern const unsigned short gamescrnPal[256];

#endif // GRIT_GAMESCRN_H

//}}BLOCK(gamescrn)
