
//{{BLOCK(instrscrn)

//======================================================================
//
//	instrscrn, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 266 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 17024 + 2048 = 19584
//
//	Time-stamp: 2018-04-15, 23:50:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRSCRN_H
#define GRIT_INSTRSCRN_H

#define instrscrnTilesLen 17024
extern const unsigned short instrscrnTiles[8512];

#define instrscrnMapLen 2048
extern const unsigned short instrscrnMap[1024];

#define instrscrnPalLen 512
extern const unsigned short instrscrnPal[256];

#endif // GRIT_INSTRSCRN_H

//}}BLOCK(instrscrn)
