
//{{BLOCK(topScrn)

//======================================================================
//
//	topScrn, 256x512@8, 
//	+ palette 256 entries, not compressed
//	+ 385 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 24640 + 4096 = 29248
//
//	Time-stamp: 2018-04-10, 17:26:29
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TOPSCRN_H
#define GRIT_TOPSCRN_H

#define topScrnTilesLen 24640
extern const unsigned short topScrnTiles[12320];

#define topScrnMapLen 4096
extern const unsigned short topScrnMap[2048];

#define topScrnPalLen 512
extern const unsigned short topScrnPal[256];

#endif // GRIT_TOPSCRN_H

//}}BLOCK(topScrn)
