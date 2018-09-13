
//{{BLOCK(startscrn)

//======================================================================
//
//	startscrn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 78 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 2496 + 2048 = 5056
//
//	Time-stamp: 2018-03-13, 20:38:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCRN_H
#define GRIT_STARTSCRN_H

#define startscrnTilesLen 2496
extern const unsigned short startscrnTiles[1248];

#define startscrnMapLen 2048
extern const unsigned short startscrnMap[1024];

#define startscrnPalLen 512
extern const unsigned short startscrnPal[256];

#endif // GRIT_STARTSCRN_H

//}}BLOCK(startscrn)
