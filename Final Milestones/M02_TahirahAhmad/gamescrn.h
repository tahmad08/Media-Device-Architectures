
//{{BLOCK(gamescrn)

//======================================================================
//
//	gamescrn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 7 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 224 + 2048 = 2784
//
//	Time-stamp: 2018-03-28, 21:58:15
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCRN_H
#define GRIT_GAMESCRN_H

#define gamescrnTilesLen 224
extern const unsigned short gamescrnTiles[112];

#define gamescrnMapLen 2048
extern const unsigned short gamescrnMap[1024];

#define gamescrnPalLen 512
extern const unsigned short gamescrnPal[256];

#endif // GRIT_GAMESCRN_H

//}}BLOCK(gamescrn)
