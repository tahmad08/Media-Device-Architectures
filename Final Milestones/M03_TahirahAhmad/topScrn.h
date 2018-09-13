
//{{BLOCK(topScrn)

//======================================================================
//
//	topScrn, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x64 
//	Total size: 512 + 64 + 4096 = 4672
//
//	Time-stamp: 2018-04-05, 11:33:38
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TOPSCRN_H
#define GRIT_TOPSCRN_H

#define topScrnTilesLen 64
extern const unsigned short topScrnTiles[32];

#define topScrnMapLen 4096
extern const unsigned short topScrnMap[2048];

#define topScrnPalLen 512
extern const unsigned short topScrnPal[256];

#endif // GRIT_TOPSCRN_H

//}}BLOCK(topScrn)
