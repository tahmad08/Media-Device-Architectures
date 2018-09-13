
//{{BLOCK(pausescrn)

//======================================================================
//
//	pausescrn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 108 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3456 + 2048 = 6016
//
//	Time-stamp: 2018-03-28, 22:00:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSESCRN_H
#define GRIT_PAUSESCRN_H

#define pausescrnTilesLen 3456
extern const unsigned short pausescrnTiles[1728];

#define pausescrnMapLen 2048
extern const unsigned short pausescrnMap[1024];

#define pausescrnPalLen 512
extern const unsigned short pausescrnPal[256];

#endif // GRIT_PAUSESCRN_H

//}}BLOCK(pausescrn)
