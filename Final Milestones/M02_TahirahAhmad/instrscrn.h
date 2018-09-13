
//{{BLOCK(instrscrn)

//======================================================================
//
//	instrscrn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 110 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3520 + 2048 = 6080
//
//	Time-stamp: 2018-03-28, 22:07:57
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRSCRN_H
#define GRIT_INSTRSCRN_H

#define instrscrnTilesLen 3520
extern const unsigned short instrscrnTiles[1760];

#define instrscrnMapLen 2048
extern const unsigned short instrscrnMap[1024];

#define instrscrnPalLen 512
extern const unsigned short instrscrnPal[256];

#endif // GRIT_INSTRSCRN_H

//}}BLOCK(instrscrn)
