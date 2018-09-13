
//{{BLOCK(losescrn)

//======================================================================
//
//	losescrn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 40 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1280 + 2048 = 3840
//
//	Time-stamp: 2018-03-28, 22:00:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESCRN_H
#define GRIT_LOSESCRN_H

#define losescrnTilesLen 1280
extern const unsigned short losescrnTiles[640];

#define losescrnMapLen 2048
extern const unsigned short losescrnMap[1024];

#define losescrnPalLen 512
extern const unsigned short losescrnPal[256];

#endif // GRIT_LOSESCRN_H

//}}BLOCK(losescrn)
