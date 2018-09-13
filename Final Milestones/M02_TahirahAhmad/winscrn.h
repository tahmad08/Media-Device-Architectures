
//{{BLOCK(winscrn)

//======================================================================
//
//	winscrn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 26 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 832 + 2048 = 3392
//
//	Time-stamp: 2018-03-28, 22:13:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCRN_H
#define GRIT_WINSCRN_H

#define winscrnTilesLen 832
extern const unsigned short winscrnTiles[416];

#define winscrnMapLen 2048
extern const unsigned short winscrnMap[1024];

#define winscrnPalLen 512
extern const unsigned short winscrnPal[256];

#endif // GRIT_WINSCRN_H

//}}BLOCK(winscrn)
