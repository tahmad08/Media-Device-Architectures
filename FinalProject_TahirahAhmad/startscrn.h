
//{{BLOCK(startscrn)

//======================================================================
//
//	startscrn, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 245 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 15680 + 2048 = 18240
//
//	Time-stamp: 2018-04-15, 23:31:32
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCRN_H
#define GRIT_STARTSCRN_H

#define startscrnTilesLen 15680
extern const unsigned short startscrnTiles[7840];

#define startscrnMapLen 2048
extern const unsigned short startscrnMap[1024];

#define startscrnPalLen 512
extern const unsigned short startscrnPal[256];

#endif // GRIT_STARTSCRN_H

//}}BLOCK(startscrn)
