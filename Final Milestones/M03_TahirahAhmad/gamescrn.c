
//{{BLOCK(gamescrn)

//======================================================================
//
//	gamescrn, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 44 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 1408 + 4096 = 6016
//
//	Time-stamp: 2018-04-04, 18:50:13
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

const unsigned short gamescrnTiles[704] __attribute__((aligned(4)))=
{
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x1111,0x1111,0x1511,0x1111,0x5551,0x1111,0x1511,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1121,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,

	0x1111,0x1111,0x2111,0x1111,0x2211,0x1112,0x2111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x2111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x5111,0x1111,0x5511,0x1115,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x5111,0x1111,

	0x1111,0x1111,0x1111,0x1111,0x1111,0x2111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1511,0x1111,0x5551,0x1111,
	0x1111,0x1112,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1511,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,

	0x1112,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1511,
	0x1111,0x1111,0x5111,0x1111,0x5511,0x1115,0x5111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x5111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,

	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1511,
	0x1111,0x5551,0x1111,0x1511,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1151,0x1111,0x1555,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1121,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x2111,0x1111,0x1111,0x1111,

	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1511,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x2111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1112,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1131,0x1111,0x1333,0x1111,

	0x1131,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1511,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1131,
	0x1111,0x1333,0x1111,0x1131,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1151,0x1111,0x1555,0x1111,0x1151,

	0x1111,0x1211,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1311,0x1111,0x3331,0x1111,0x1311,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1151,0x1111,0x1555,0x1111,0x1151,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1121,

	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x2111,0x1111,0x2211,0x1112,0x2111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x5111,0x1111,0x5511,0x1115,
	0x5111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x2111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1511,0x1111,0x5551,0x1111,
	0x1511,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,

	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x5111,0x1111,0x5511,0x1115,0x5111,0x1111,
	0x1111,0x5111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1121,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1121,0x1111,0x1111,0x1111,0x1111,

	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x2111,0x1111,
	0x2211,0x1112,0x2111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1511,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x5111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,0x1111,
	0x1111,0x1111,0x1111,0x1511,0x1111,0x5551,0x1111,0x1511,
};

const unsigned short gamescrnMap[2048] __attribute__((aligned(4)))=
{
	0x4001,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4003,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4004,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4005,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4006,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4007,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4807,0x4002,0x4002,0x4008,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4806,0x4002,0x4009,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x400A,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x400B,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x400C,0x400D,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x400E,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x400F,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4001,0x4002,0x4002,0x4C08,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4010,0x4002,
	0x4002,0x4002,0x480A,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4011,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4012,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4C0D,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4407,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4013,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4C06,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4014,0x4002,

	0x4002,0x4002,0x4002,0x4015,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4C03,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4016,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4017,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4018,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4019,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x401A,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x401B,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4416,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x401C,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x401D,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4C01,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x401E,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x441B,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x401F,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4020,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4C0C,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4021,0x4002,0x4002,0x4022,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4821,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4415,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4023,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4C05,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4019,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4024,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x441B,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x400D,0x4002,
	0x4002,0x4002,0x4002,0x4025,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4C22,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4C11,0x4002,
	0x4002,0x4002,0x4C15,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4C10,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4026,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4C21,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4C16,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4823,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x400B,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4027,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4028,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4808,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4824,0x4002,0x4002,0x4805,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x400E,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4816,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4C1B,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4408,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4029,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4821,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x402A,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4823,0x4002,0x4002,0x480C,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x402B,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4C13,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,

	0x4002,0x4C2B,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x441C,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
	0x440E,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,0x4002,
};

const unsigned short gamescrnPal[256] __attribute__((aligned(4)))=
{
	0x0000,0x0010,0x0200,0x0210,0x4000,0x4010,0x4200,0x6318,
	0x4210,0x001F,0x03E0,0x03FF,0x7C00,0x7C1F,0x7FE0,0x7FFF,
	0x0004,0x0007,0x000B,0x000F,0x0013,0x0017,0x001B,0x001F,
	0x0080,0x00E0,0x0160,0x01E0,0x0260,0x02E0,0x0360,0x03E0,
	0x0084,0x00E7,0x016B,0x01EF,0x0273,0x02F7,0x037B,0x03FF,
	0x1000,0x1C00,0x2C00,0x3C00,0x4C00,0x5C00,0x6C00,0x7C00,
	0x1004,0x1C07,0x2C0B,0x3C0F,0x4C13,0x5C17,0x6C1B,0x7C1F,
	0x1080,0x1CE0,0x2D60,0x3DE0,0x4E60,0x5EE0,0x6F60,0x7FE0,

	0x0842,0x0C63,0x14A5,0x1CE7,0x2529,0x2D6B,0x35AD,0x3DEF,
	0x4631,0x4E73,0x56B5,0x5EF7,0x6739,0x6F7B,0x77BD,0x7FFF,
	0x001F,0x007F,0x00FF,0x017F,0x01FF,0x027F,0x02FF,0x037F,
	0x03FF,0x03FC,0x03F8,0x03F4,0x03F0,0x03EC,0x03E8,0x03E4,
	0x03E0,0x0FE0,0x1FE0,0x2FE0,0x3FE0,0x4FE0,0x5FE0,0x6FE0,
	0x7FE0,0x7F80,0x7F00,0x7E80,0x7E00,0x7D80,0x7D00,0x7C80,
	0x7C00,0x7C03,0x7C07,0x7C0B,0x7C0F,0x7C13,0x7C17,0x7C1B,
	0x7C1F,0x701F,0x601F,0x501F,0x401F,0x301F,0x201F,0x101F,

	0x001F,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0421,0x0842,0x0C63,0x1084,0x14A5,0x18C6,0x1CE7,
	0x2108,0x2529,0x294A,0x2D6B,0x318C,0x35AD,0x39CE,0x3DEF,
	0x4210,0x4631,0x4A52,0x4E73,0x5294,0x56B5,0x5AD6,0x5EF7,
	0x6318,0x6739,0x6B5A,0x6F7B,0x739C,0x77BD,0x7BDE,0x7FFF,
};

//}}BLOCK(gamescrn)
