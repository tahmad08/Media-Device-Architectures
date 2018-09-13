
//{{BLOCK(bgo)

//======================================================================
//
//	bgo, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 4 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 256 + 2048 = 2816
//
//	Time-stamp: 2018-04-14, 15:29:59
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGO_H
#define GRIT_BGO_H

#define bgoTilesLen 256
extern const unsigned short bgoTiles[128];

#define bgoMapLen 2048
extern const unsigned short bgoMap[1024];

#define bgoPalLen 512
extern const unsigned short bgoPal[256];

#endif // GRIT_BGO_H

//}}BLOCK(bgo)
