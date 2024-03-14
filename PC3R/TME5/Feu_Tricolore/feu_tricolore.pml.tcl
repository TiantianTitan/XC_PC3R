# maxx 1
wm title . "scenario"
wm geometry . 480x600+650+100
canvas .c -width 800 -height 800 \
	-scrollregion {0c -1c 30c 100c} \
	-xscrollcommand ".hscroll set" \
	-yscrollcommand ".vscroll set" \
	-bg white -relief raised -bd 2
scrollbar .vscroll -relief sunken  -command ".c yview"
scrollbar .hscroll -relief sunken -orient horiz  -command ".c xview"
pack append . \
	.vscroll {right filly} \
	.hscroll {bottom fillx} \
	.c {top expand fill}
.c yview moveto 0
# ProcLine[2] stays at 0 (Used 0 nobox 0)
.c create rectangle 240 0 364 20 -fill black
# ProcLine[2] stays at 0 (Used 0 nobox 0)
.c create rectangle 239 -2 361 18 -fill ivory
.c create text 300 8 -text "1:observateur"
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 118 0 166 20 -fill black
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 116 -2 164 18 -fill ivory
.c create text 140 8 -text "0:feu"
.c create text 70 32 -fill #eef -text "1"
.c create line 140 32 300 32 -fill #eef -dash {6 4}
.c create line 140 36 140 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 0 to 1 (Used 1 nobox 0)
# ProcLine[1] stays at 1 (Used 1 nobox 1)
.c create rectangle 68 22 212 42 -fill white -width 0
.c create text 140 32 -text "observe!ROUGE,0"
.c create line 140 42 220 42 -fill darkred -tags mesg -width 2
.c create line 220 42 300 42 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 300 56 -fill #eef -dash {6 4}
.c create line 300 36 300 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 0 to 3 (Used 1 nobox 1)
# ProcLine[2] stays at 3 (Used 1 nobox 1)
.c create rectangle 228 46 372 66 -fill white -width 0
.c create text 300 56 -text "observe?ROUGE,0"
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 300 80 -fill #eef -dash {6 4}
.c create line 300 72 300 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 3 to 5 (Used 1 nobox 1)
# ProcLine[2] stays at 5 (Used 1 nobox 1)
.c create rectangle 210 70 390 90 -fill white -width 0
.c create text 300 80 -text "Observateur: ROUGE"
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 300 104 -fill #eef -dash {6 4}
.c create line 140 48 140 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 1 to 7 (Used 1 nobox 1)
# ProcLine[1] stays at 7 (Used 1 nobox 1)
.c create rectangle 74 94 206 114 -fill white -width 0
.c create text 140 104 -text "observe!VERT,0"
.c create line 140 114 220 114 -fill darkred -tags mesg -width 2
.c create line 220 114 300 114 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 300 128 -fill #eef -dash {6 4}
.c create line 300 96 300 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 5 to 9 (Used 1 nobox 1)
# ProcLine[2] stays at 9 (Used 1 nobox 1)
.c create rectangle 234 118 366 138 -fill white -width 0
.c create text 300 128 -text "observe?VERT,0"
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 300 152 -fill #eef -dash {6 4}
.c create line 300 144 300 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 9 to 11 (Used 1 nobox 1)
# ProcLine[2] stays at 11 (Used 1 nobox 1)
.c create rectangle 215 142 385 162 -fill white -width 0
.c create text 300 152 -text "Observateur: VERT"
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 300 176 -fill #eef -dash {6 4}
.c create line 140 120 140 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 7 to 13 (Used 1 nobox 1)
# ProcLine[1] stays at 13 (Used 1 nobox 1)
.c create rectangle 74 166 206 186 -fill white -width 0
.c create text 140 176 -text "observe!VERT,0"
.c create line 140 186 220 186 -fill darkred -tags mesg -width 2
.c create line 220 186 300 186 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 300 200 -fill #eef -dash {6 4}
.c create line 300 168 300 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 11 to 15 (Used 1 nobox 1)
# ProcLine[2] stays at 15 (Used 1 nobox 1)
.c create rectangle 234 190 366 210 -fill white -width 0
.c create text 300 200 -text "observe?VERT,0"
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 300 224 -fill #eef -dash {6 4}
.c create line 300 216 300 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 15 to 17 (Used 1 nobox 1)
# ProcLine[2] stays at 17 (Used 1 nobox 1)
.c create rectangle 215 214 385 234 -fill white -width 0
.c create text 300 224 -text "Observateur: VERT"
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 300 248 -fill #eef -dash {6 4}
.c create line 140 192 140 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 13 to 19 (Used 1 nobox 1)
# ProcLine[1] stays at 19 (Used 1 nobox 1)
.c create rectangle 74 238 206 258 -fill white -width 0
.c create text 140 248 -text "observe!VERT,0"
.c create line 140 258 220 258 -fill darkred -tags mesg -width 2
.c create line 220 258 300 258 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 300 272 -fill #eef -dash {6 4}
.c create line 300 240 300 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 17 to 21 (Used 1 nobox 1)
# ProcLine[2] stays at 21 (Used 1 nobox 1)
.c create rectangle 234 262 366 282 -fill white -width 0
.c create text 300 272 -text "observe?VERT,0"
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 300 296 -fill #eef -dash {6 4}
.c create line 300 288 300 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 21 to 23 (Used 1 nobox 1)
# ProcLine[2] stays at 23 (Used 1 nobox 1)
.c create rectangle 215 286 385 306 -fill white -width 0
.c create text 300 296 -text "Observateur: VERT"
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 300 320 -fill #eef -dash {6 4}
.c create line 140 264 140 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 19 to 25 (Used 1 nobox 1)
# ProcLine[1] stays at 25 (Used 1 nobox 1)
.c create rectangle 74 310 206 330 -fill white -width 0
.c create text 140 320 -text "observe!VERT,0"
.c create line 140 330 220 330 -fill darkred -tags mesg -width 2
.c create line 220 330 300 330 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 300 344 -fill #eef -dash {6 4}
.c create line 300 312 300 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 23 to 27 (Used 1 nobox 1)
# ProcLine[2] stays at 27 (Used 1 nobox 1)
.c create rectangle 234 334 366 354 -fill white -width 0
.c create text 300 344 -text "observe?VERT,0"
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 300 368 -fill #eef -dash {6 4}
.c create line 300 360 300 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 27 to 29 (Used 1 nobox 1)
# ProcLine[2] stays at 29 (Used 1 nobox 1)
.c create rectangle 215 358 385 378 -fill white -width 0
.c create text 300 368 -text "Observateur: VERT"
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 300 392 -fill #eef -dash {6 4}
.c create line 140 336 140 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 25 to 31 (Used 1 nobox 1)
# ProcLine[1] stays at 31 (Used 1 nobox 1)
.c create rectangle 66 382 214 402 -fill white -width 0
.c create text 140 392 -text "observe!ORANGE,1"
.c create line 140 402 220 402 -fill darkred -tags mesg -width 2
.c create line 220 402 300 402 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 300 416 -fill #eef -dash {6 4}
.c create line 300 384 300 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 29 to 33 (Used 1 nobox 1)
# ProcLine[2] stays at 33 (Used 1 nobox 1)
.c create rectangle 226 406 374 426 -fill white -width 0
.c create text 300 416 -text "observe?ORANGE,1"
.c create text 70 440 -fill #eef -text "35"
.c create line 140 440 300 440 -fill #eef -dash {6 4}
.c create line 140 408 140 428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 31 to 35 (Used 1 nobox 1)
# ProcLine[1] stays at 35 (Used 1 nobox 1)
.c create rectangle 66 430 214 450 -fill white -width 0
.c create text 140 440 -text "observe!ORANGE,1"
.c create line 140 450 220 450 -fill darkred -tags mesg -width 2
.c create line 220 450 300 450 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 464 -fill #eef -text "37"
.c create line 140 464 300 464 -fill #eef -dash {6 4}
.c create line 300 432 300 452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 33 to 37 (Used 1 nobox 1)
# ProcLine[2] stays at 37 (Used 1 nobox 1)
.c create rectangle 226 454 374 474 -fill white -width 0
.c create text 300 464 -text "observe?ORANGE,1"
.c create text 70 488 -fill #eef -text "39"
.c create line 140 488 300 488 -fill #eef -dash {6 4}
.c create line 140 456 140 476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 35 to 39 (Used 1 nobox 1)
# ProcLine[1] stays at 39 (Used 1 nobox 1)
.c create rectangle 66 478 214 498 -fill white -width 0
.c create text 140 488 -text "observe!ORANGE,1"
.c create line 140 498 220 498 -fill darkred -tags mesg -width 2
.c create line 220 498 300 498 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 512 -fill #eef -text "41"
.c create line 140 512 300 512 -fill #eef -dash {6 4}
.c create line 300 480 300 500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 37 to 41 (Used 1 nobox 1)
# ProcLine[2] stays at 41 (Used 1 nobox 1)
.c create rectangle 226 502 374 522 -fill white -width 0
.c create text 300 512 -text "observe?ORANGE,1"
.c create text 70 536 -fill #eef -text "43"
.c create line 140 536 300 536 -fill #eef -dash {6 4}
.c create line 140 504 140 524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 39 to 43 (Used 1 nobox 1)
# ProcLine[1] stays at 43 (Used 1 nobox 1)
.c create rectangle 66 526 214 546 -fill white -width 0
.c create text 140 536 -text "observe!ORANGE,1"
.c create line 140 546 220 546 -fill darkred -tags mesg -width 2
.c create line 220 546 300 546 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 560 -fill #eef -text "45"
.c create line 140 560 300 560 -fill #eef -dash {6 4}
.c create line 300 528 300 548 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 41 to 45 (Used 1 nobox 1)
# ProcLine[2] stays at 45 (Used 1 nobox 1)
.c create rectangle 226 550 374 570 -fill white -width 0
.c create text 300 560 -text "observe?ORANGE,1"
.c create text 70 584 -fill #eef -text "47"
.c create line 140 584 300 584 -fill #eef -dash {6 4}
.c create line 300 576 300 572 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 45 to 47 (Used 1 nobox 1)
# ProcLine[2] stays at 47 (Used 1 nobox 1)
.c create rectangle 204 574 396 594 -fill white -width 0
.c create text 300 584 -text "Observateur: ORANGE"
.c create text 70 608 -fill #eef -text "49"
.c create line 140 608 300 608 -fill #eef -dash {6 4}
.c create line 140 552 140 596 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 43 to 49 (Used 1 nobox 1)
# ProcLine[1] stays at 49 (Used 1 nobox 1)
.c create rectangle 66 598 214 618 -fill white -width 0
.c create text 140 608 -text "observe!ORANGE,1"
.c create line 140 618 220 618 -fill darkred -tags mesg -width 2
.c create line 220 618 300 618 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 632 -fill #eef -text "51"
.c create line 140 632 300 632 -fill #eef -dash {6 4}
.c create line 300 600 300 620 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 47 to 51 (Used 1 nobox 1)
# ProcLine[2] stays at 51 (Used 1 nobox 1)
.c create rectangle 226 622 374 642 -fill white -width 0
.c create text 300 632 -text "observe?ORANGE,1"
.c create text 70 656 -fill #eef -text "53"
.c create line 140 656 300 656 -fill #eef -dash {6 4}
.c create line 140 624 140 644 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 49 to 53 (Used 1 nobox 1)
# ProcLine[1] stays at 53 (Used 1 nobox 1)
.c create rectangle 66 646 214 666 -fill white -width 0
.c create text 140 656 -text "observe!ORANGE,1"
.c create line 140 666 220 666 -fill darkred -tags mesg -width 2
.c create line 220 666 300 666 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 680 -fill #eef -text "55"
.c create line 140 680 300 680 -fill #eef -dash {6 4}
.c create line 300 648 300 668 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 51 to 55 (Used 1 nobox 1)
# ProcLine[2] stays at 55 (Used 1 nobox 1)
.c create rectangle 226 670 374 690 -fill white -width 0
.c create text 300 680 -text "observe?ORANGE,1"
.c create text 70 704 -fill #eef -text "57"
.c create line 140 704 300 704 -fill #eef -dash {6 4}
.c create line 140 672 140 692 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 53 to 57 (Used 1 nobox 1)
# ProcLine[1] stays at 57 (Used 1 nobox 1)
.c create rectangle 66 694 214 714 -fill white -width 0
.c create text 140 704 -text "observe!ORANGE,1"
.c create line 140 714 220 714 -fill darkred -tags mesg -width 2
.c create line 220 714 300 714 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 728 -fill #eef -text "59"
.c create line 140 728 300 728 -fill #eef -dash {6 4}
.c create line 300 696 300 716 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 55 to 59 (Used 1 nobox 1)
# ProcLine[2] stays at 59 (Used 1 nobox 1)
.c create rectangle 226 718 374 738 -fill white -width 0
.c create text 300 728 -text "observe?ORANGE,1"
.c create text 70 752 -fill #eef -text "61"
.c create line 140 752 300 752 -fill #eef -dash {6 4}
.c create line 300 744 300 740 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 59 to 61 (Used 1 nobox 1)
# ProcLine[2] stays at 61 (Used 1 nobox 1)
.c create rectangle 204 742 396 762 -fill white -width 0
.c create text 300 752 -text "Observateur: ORANGE"
.c create text 70 776 -fill #eef -text "63"
.c create line 140 776 300 776 -fill #eef -dash {6 4}
.c create line 140 720 140 764 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 57 to 63 (Used 1 nobox 1)
# ProcLine[1] stays at 63 (Used 1 nobox 1)
.c create rectangle 66 766 214 786 -fill white -width 0
.c create text 140 776 -text "observe!ORANGE,1"
.c create line 140 786 220 786 -fill darkred -tags mesg -width 2
.c create line 220 786 300 786 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 800 -fill #eef -text "65"
.c create line 140 800 300 800 -fill #eef -dash {6 4}
.c create line 300 768 300 788 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 61 to 65 (Used 1 nobox 1)
# ProcLine[2] stays at 65 (Used 1 nobox 1)
.c create rectangle 226 790 374 810 -fill white -width 0
.c create text 300 800 -text "observe?ORANGE,1"
.c create text 70 824 -fill #eef -text "67"
.c create line 140 824 300 824 -fill #eef -dash {6 4}
.c create line 140 792 140 812 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 63 to 67 (Used 1 nobox 1)
# ProcLine[1] stays at 67 (Used 1 nobox 1)
.c create rectangle 66 814 214 834 -fill white -width 0
.c create text 140 824 -text "observe!ORANGE,1"
.c create line 140 834 220 834 -fill darkred -tags mesg -width 2
.c create line 220 834 300 834 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 848 -fill #eef -text "69"
.c create line 140 848 300 848 -fill #eef -dash {6 4}
.c create line 300 816 300 836 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 65 to 69 (Used 1 nobox 1)
# ProcLine[2] stays at 69 (Used 1 nobox 1)
.c create rectangle 226 838 374 858 -fill white -width 0
.c create text 300 848 -text "observe?ORANGE,1"
.c create text 70 872 -fill #eef -text "71"
.c create line 140 872 300 872 -fill #eef -dash {6 4}
.c create line 300 864 300 860 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 69 to 71 (Used 1 nobox 1)
# ProcLine[2] stays at 71 (Used 1 nobox 1)
.c create rectangle 204 862 396 882 -fill white -width 0
.c create text 300 872 -text "Observateur: ORANGE"
.c create text 70 896 -fill #eef -text "73"
.c create line 140 896 300 896 -fill #eef -dash {6 4}
.c create line 140 840 140 884 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 67 to 73 (Used 1 nobox 1)
# ProcLine[1] stays at 73 (Used 1 nobox 1)
.c create rectangle 66 886 214 906 -fill white -width 0
.c create text 140 896 -text "observe!ORANGE,1"
.c create line 140 906 220 906 -fill darkred -tags mesg -width 2
.c create line 220 906 300 906 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 920 -fill #eef -text "75"
.c create line 140 920 300 920 -fill #eef -dash {6 4}
.c create line 300 888 300 908 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 71 to 75 (Used 1 nobox 1)
# ProcLine[2] stays at 75 (Used 1 nobox 1)
.c create rectangle 226 910 374 930 -fill white -width 0
.c create text 300 920 -text "observe?ORANGE,1"
.c create text 70 944 -fill #eef -text "77"
.c create line 140 944 300 944 -fill #eef -dash {6 4}
.c create line 140 912 140 932 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 73 to 77 (Used 1 nobox 1)
# ProcLine[1] stays at 77 (Used 1 nobox 1)
.c create rectangle 66 934 214 954 -fill white -width 0
.c create text 140 944 -text "observe!ORANGE,1"
.c create line 140 954 220 954 -fill darkred -tags mesg -width 2
.c create line 220 954 300 954 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 968 -fill #eef -text "79"
.c create line 140 968 300 968 -fill #eef -dash {6 4}
.c create line 300 936 300 956 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 75 to 79 (Used 1 nobox 1)
# ProcLine[2] stays at 79 (Used 1 nobox 1)
.c create rectangle 226 958 374 978 -fill white -width 0
.c create text 300 968 -text "observe?ORANGE,1"
.c create text 70 992 -fill #eef -text "81"
.c create line 140 992 300 992 -fill #eef -dash {6 4}
.c create line 140 960 140 980 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 77 to 81 (Used 1 nobox 1)
# ProcLine[1] stays at 81 (Used 1 nobox 1)
.c create rectangle 66 982 214 1002 -fill white -width 0
.c create text 140 992 -text "observe!ORANGE,1"
.c create line 140 1002 220 1002 -fill darkred -tags mesg -width 2
.c create line 220 1002 300 1002 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1016 -fill #eef -text "83"
.c create line 140 1016 300 1016 -fill #eef -dash {6 4}
.c create line 300 984 300 1004 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 79 to 83 (Used 1 nobox 1)
# ProcLine[2] stays at 83 (Used 1 nobox 1)
.c create rectangle 226 1006 374 1026 -fill white -width 0
.c create text 300 1016 -text "observe?ORANGE,1"
.c create text 70 1040 -fill #eef -text "85"
.c create line 140 1040 300 1040 -fill #eef -dash {6 4}
.c create line 300 1032 300 1028 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 83 to 85 (Used 1 nobox 1)
# ProcLine[2] stays at 85 (Used 1 nobox 1)
.c create rectangle 204 1030 396 1050 -fill white -width 0
.c create text 300 1040 -text "Observateur: ORANGE"
.c create text 70 1064 -fill #eef -text "87"
.c create line 140 1064 300 1064 -fill #eef -dash {6 4}
.c create line 140 1008 140 1052 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 81 to 87 (Used 1 nobox 1)
# ProcLine[1] stays at 87 (Used 1 nobox 1)
.c create rectangle 66 1054 214 1074 -fill white -width 0
.c create text 140 1064 -text "observe!ORANGE,1"
.c create line 140 1074 220 1074 -fill darkred -tags mesg -width 2
.c create line 220 1074 300 1074 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1088 -fill #eef -text "89"
.c create line 140 1088 300 1088 -fill #eef -dash {6 4}
.c create line 300 1056 300 1076 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 85 to 89 (Used 1 nobox 1)
# ProcLine[2] stays at 89 (Used 1 nobox 1)
.c create rectangle 226 1078 374 1098 -fill white -width 0
.c create text 300 1088 -text "observe?ORANGE,1"
.c create text 70 1112 -fill #eef -text "91"
.c create line 140 1112 300 1112 -fill #eef -dash {6 4}
.c create line 140 1080 140 1100 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 87 to 91 (Used 1 nobox 1)
# ProcLine[1] stays at 91 (Used 1 nobox 1)
.c create rectangle 66 1102 214 1122 -fill white -width 0
.c create text 140 1112 -text "observe!ORANGE,1"
.c create line 140 1122 220 1122 -fill darkred -tags mesg -width 2
.c create line 220 1122 300 1122 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1136 -fill #eef -text "93"
.c create line 140 1136 300 1136 -fill #eef -dash {6 4}
.c create line 300 1104 300 1124 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 89 to 93 (Used 1 nobox 1)
# ProcLine[2] stays at 93 (Used 1 nobox 1)
.c create rectangle 226 1126 374 1146 -fill white -width 0
.c create text 300 1136 -text "observe?ORANGE,1"
.c create text 70 1160 -fill #eef -text "95"
.c create line 140 1160 300 1160 -fill #eef -dash {6 4}
.c create line 140 1128 140 1148 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 91 to 95 (Used 1 nobox 1)
# ProcLine[1] stays at 95 (Used 1 nobox 1)
.c create rectangle 66 1150 214 1170 -fill white -width 0
.c create text 140 1160 -text "observe!ORANGE,1"
.c create line 140 1170 220 1170 -fill darkred -tags mesg -width 2
.c create line 220 1170 300 1170 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1184 -fill #eef -text "97"
.c create line 140 1184 300 1184 -fill #eef -dash {6 4}
.c create line 300 1152 300 1172 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 93 to 97 (Used 1 nobox 1)
# ProcLine[2] stays at 97 (Used 1 nobox 1)
.c create rectangle 226 1174 374 1194 -fill white -width 0
.c create text 300 1184 -text "observe?ORANGE,1"
.c create text 70 1208 -fill #eef -text "99"
.c create line 140 1208 300 1208 -fill #eef -dash {6 4}
.c create line 140 1176 140 1196 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 95 to 99 (Used 1 nobox 1)
# ProcLine[1] stays at 99 (Used 1 nobox 1)
.c create rectangle 66 1198 214 1218 -fill white -width 0
.c create text 140 1208 -text "observe!ORANGE,1"
.c create line 140 1218 220 1218 -fill darkred -tags mesg -width 2
.c create line 220 1218 300 1218 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1232 -fill #eef -text "101"
.c create line 140 1232 300 1232 -fill #eef -dash {6 4}
.c create line 300 1200 300 1220 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 97 to 101 (Used 1 nobox 1)
# ProcLine[2] stays at 101 (Used 1 nobox 1)
.c create rectangle 226 1222 374 1242 -fill white -width 0
.c create text 300 1232 -text "observe?ORANGE,1"
.c create text 70 1256 -fill #eef -text "103"
.c create line 140 1256 300 1256 -fill #eef -dash {6 4}
.c create line 140 1224 140 1244 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 99 to 103 (Used 1 nobox 1)
# ProcLine[1] stays at 103 (Used 1 nobox 1)
.c create rectangle 66 1246 214 1266 -fill white -width 0
.c create text 140 1256 -text "observe!ORANGE,1"
.c create line 140 1266 220 1266 -fill darkred -tags mesg -width 2
.c create line 220 1266 300 1266 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1280 -fill #eef -text "105"
.c create line 140 1280 300 1280 -fill #eef -dash {6 4}
.c create line 300 1248 300 1268 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 101 to 105 (Used 1 nobox 1)
# ProcLine[2] stays at 105 (Used 1 nobox 1)
.c create rectangle 226 1270 374 1290 -fill white -width 0
.c create text 300 1280 -text "observe?ORANGE,1"
.c create text 70 1304 -fill #eef -text "107"
.c create line 140 1304 300 1304 -fill #eef -dash {6 4}
.c create line 140 1272 140 1292 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 103 to 107 (Used 1 nobox 1)
# ProcLine[1] stays at 107 (Used 1 nobox 1)
.c create rectangle 66 1294 214 1314 -fill white -width 0
.c create text 140 1304 -text "observe!ORANGE,1"
.c create line 140 1314 220 1314 -fill darkred -tags mesg -width 2
.c create line 220 1314 300 1314 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1328 -fill #eef -text "109"
.c create line 140 1328 300 1328 -fill #eef -dash {6 4}
.c create line 300 1296 300 1316 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 105 to 109 (Used 1 nobox 1)
# ProcLine[2] stays at 109 (Used 1 nobox 1)
.c create rectangle 226 1318 374 1338 -fill white -width 0
.c create text 300 1328 -text "observe?ORANGE,1"
.c create text 70 1352 -fill #eef -text "111"
.c create line 140 1352 300 1352 -fill #eef -dash {6 4}
.c create line 300 1344 300 1340 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 109 to 111 (Used 1 nobox 1)
# ProcLine[2] stays at 111 (Used 1 nobox 1)
.c create rectangle 204 1342 396 1362 -fill white -width 0
.c create text 300 1352 -text "Observateur: ORANGE"
.c create text 70 1376 -fill #eef -text "113"
.c create line 140 1376 300 1376 -fill #eef -dash {6 4}
.c create line 140 1320 140 1364 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 107 to 113 (Used 1 nobox 1)
# ProcLine[1] stays at 113 (Used 1 nobox 1)
.c create rectangle 66 1366 214 1386 -fill white -width 0
.c create text 140 1376 -text "observe!ORANGE,1"
.c create line 140 1386 220 1386 -fill darkred -tags mesg -width 2
.c create line 220 1386 300 1386 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1400 -fill #eef -text "115"
.c create line 140 1400 300 1400 -fill #eef -dash {6 4}
.c create line 300 1368 300 1388 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 111 to 115 (Used 1 nobox 1)
# ProcLine[2] stays at 115 (Used 1 nobox 1)
.c create rectangle 226 1390 374 1410 -fill white -width 0
.c create text 300 1400 -text "observe?ORANGE,1"
.c create text 70 1424 -fill #eef -text "117"
.c create line 140 1424 300 1424 -fill #eef -dash {6 4}
.c create line 140 1392 140 1412 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 113 to 117 (Used 1 nobox 1)
# ProcLine[1] stays at 117 (Used 1 nobox 1)
.c create rectangle 66 1414 214 1434 -fill white -width 0
.c create text 140 1424 -text "observe!ORANGE,1"
.c create line 140 1434 220 1434 -fill darkred -tags mesg -width 2
.c create line 220 1434 300 1434 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1448 -fill #eef -text "119"
.c create line 140 1448 300 1448 -fill #eef -dash {6 4}
.c create line 300 1416 300 1436 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 115 to 119 (Used 1 nobox 1)
# ProcLine[2] stays at 119 (Used 1 nobox 1)
.c create rectangle 226 1438 374 1458 -fill white -width 0
.c create text 300 1448 -text "observe?ORANGE,1"
.c create text 70 1472 -fill #eef -text "121"
.c create line 140 1472 300 1472 -fill #eef -dash {6 4}
.c create line 300 1464 300 1460 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 119 to 121 (Used 1 nobox 1)
# ProcLine[2] stays at 121 (Used 1 nobox 1)
.c create rectangle 204 1462 396 1482 -fill white -width 0
.c create text 300 1472 -text "Observateur: ORANGE"
.c create text 70 1496 -fill #eef -text "123"
.c create line 140 1496 300 1496 -fill #eef -dash {6 4}
.c create line 140 1440 140 1484 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 117 to 123 (Used 1 nobox 1)
# ProcLine[1] stays at 123 (Used 1 nobox 1)
.c create rectangle 66 1486 214 1506 -fill white -width 0
.c create text 140 1496 -text "observe!ORANGE,1"
.c create line 140 1506 220 1506 -fill darkred -tags mesg -width 2
.c create line 220 1506 300 1506 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1520 -fill #eef -text "125"
.c create line 140 1520 300 1520 -fill #eef -dash {6 4}
.c create line 300 1488 300 1508 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 121 to 125 (Used 1 nobox 1)
# ProcLine[2] stays at 125 (Used 1 nobox 1)
.c create rectangle 226 1510 374 1530 -fill white -width 0
.c create text 300 1520 -text "observe?ORANGE,1"
.c create text 70 1544 -fill #eef -text "127"
.c create line 140 1544 300 1544 -fill #eef -dash {6 4}
.c create line 300 1536 300 1532 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 125 to 127 (Used 1 nobox 1)
# ProcLine[2] stays at 127 (Used 1 nobox 1)
.c create rectangle 204 1534 396 1554 -fill white -width 0
.c create text 300 1544 -text "Observateur: ORANGE"
.c create text 70 1568 -fill #eef -text "129"
.c create line 140 1568 300 1568 -fill #eef -dash {6 4}
.c create line 140 1512 140 1556 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 123 to 129 (Used 1 nobox 1)
# ProcLine[1] stays at 129 (Used 1 nobox 1)
.c create rectangle 66 1558 214 1578 -fill white -width 0
.c create text 140 1568 -text "observe!ORANGE,1"
.c create line 140 1578 220 1578 -fill darkred -tags mesg -width 2
.c create line 220 1578 300 1578 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1592 -fill #eef -text "131"
.c create line 140 1592 300 1592 -fill #eef -dash {6 4}
.c create line 300 1560 300 1580 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 127 to 131 (Used 1 nobox 1)
# ProcLine[2] stays at 131 (Used 1 nobox 1)
.c create rectangle 226 1582 374 1602 -fill white -width 0
.c create text 300 1592 -text "observe?ORANGE,1"
.c create text 70 1616 -fill #eef -text "133"
.c create line 140 1616 300 1616 -fill #eef -dash {6 4}
.c create line 140 1584 140 1604 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 129 to 133 (Used 1 nobox 1)
# ProcLine[1] stays at 133 (Used 1 nobox 1)
.c create rectangle 66 1606 214 1626 -fill white -width 0
.c create text 140 1616 -text "observe!ORANGE,1"
.c create line 140 1626 220 1626 -fill darkred -tags mesg -width 2
.c create line 220 1626 300 1626 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1640 -fill #eef -text "135"
.c create line 140 1640 300 1640 -fill #eef -dash {6 4}
.c create line 300 1608 300 1628 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 131 to 135 (Used 1 nobox 1)
# ProcLine[2] stays at 135 (Used 1 nobox 1)
.c create rectangle 226 1630 374 1650 -fill white -width 0
.c create text 300 1640 -text "observe?ORANGE,1"
.c create text 70 1664 -fill #eef -text "137"
.c create line 140 1664 300 1664 -fill #eef -dash {6 4}
.c create line 300 1656 300 1652 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 135 to 137 (Used 1 nobox 1)
# ProcLine[2] stays at 137 (Used 1 nobox 1)
.c create rectangle 204 1654 396 1674 -fill white -width 0
.c create text 300 1664 -text "Observateur: ORANGE"
.c create text 70 1688 -fill #eef -text "139"
.c create line 140 1688 300 1688 -fill #eef -dash {6 4}
.c create line 140 1632 140 1676 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 133 to 139 (Used 1 nobox 1)
# ProcLine[1] stays at 139 (Used 1 nobox 1)
.c create rectangle 66 1678 214 1698 -fill white -width 0
.c create text 140 1688 -text "observe!ORANGE,1"
.c create line 140 1698 220 1698 -fill darkred -tags mesg -width 2
.c create line 220 1698 300 1698 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1712 -fill #eef -text "141"
.c create line 140 1712 300 1712 -fill #eef -dash {6 4}
.c create line 300 1680 300 1700 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 137 to 141 (Used 1 nobox 1)
# ProcLine[2] stays at 141 (Used 1 nobox 1)
.c create rectangle 226 1702 374 1722 -fill white -width 0
.c create text 300 1712 -text "observe?ORANGE,1"
.c create text 70 1736 -fill #eef -text "143"
.c create line 140 1736 300 1736 -fill #eef -dash {6 4}
.c create line 140 1704 140 1724 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 139 to 143 (Used 1 nobox 1)
# ProcLine[1] stays at 143 (Used 1 nobox 1)
.c create rectangle 66 1726 214 1746 -fill white -width 0
.c create text 140 1736 -text "observe!ORANGE,1"
.c create line 140 1746 220 1746 -fill darkred -tags mesg -width 2
.c create line 220 1746 300 1746 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1760 -fill #eef -text "145"
.c create line 140 1760 300 1760 -fill #eef -dash {6 4}
.c create line 300 1728 300 1748 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 141 to 145 (Used 1 nobox 1)
# ProcLine[2] stays at 145 (Used 1 nobox 1)
.c create rectangle 226 1750 374 1770 -fill white -width 0
.c create text 300 1760 -text "observe?ORANGE,1"
.c create text 70 1784 -fill #eef -text "147"
.c create line 140 1784 300 1784 -fill #eef -dash {6 4}
.c create line 300 1776 300 1772 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 145 to 147 (Used 1 nobox 1)
# ProcLine[2] stays at 147 (Used 1 nobox 1)
.c create rectangle 204 1774 396 1794 -fill white -width 0
.c create text 300 1784 -text "Observateur: ORANGE"
.c create text 70 1808 -fill #eef -text "149"
.c create line 140 1808 300 1808 -fill #eef -dash {6 4}
.c create line 140 1752 140 1796 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 143 to 149 (Used 1 nobox 1)
# ProcLine[1] stays at 149 (Used 1 nobox 1)
.c create rectangle 66 1798 214 1818 -fill white -width 0
.c create text 140 1808 -text "observe!ORANGE,1"
.c create line 140 1818 220 1818 -fill darkred -tags mesg -width 2
.c create line 220 1818 300 1818 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1832 -fill #eef -text "151"
.c create line 140 1832 300 1832 -fill #eef -dash {6 4}
.c create line 300 1800 300 1820 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 147 to 151 (Used 1 nobox 1)
# ProcLine[2] stays at 151 (Used 1 nobox 1)
.c create rectangle 226 1822 374 1842 -fill white -width 0
.c create text 300 1832 -text "observe?ORANGE,1"
.c create text 70 1856 -fill #eef -text "153"
.c create line 140 1856 300 1856 -fill #eef -dash {6 4}
.c create line 140 1824 140 1844 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 149 to 153 (Used 1 nobox 1)
# ProcLine[1] stays at 153 (Used 1 nobox 1)
.c create rectangle 66 1846 214 1866 -fill white -width 0
.c create text 140 1856 -text "observe!ORANGE,1"
.c create line 140 1866 220 1866 -fill darkred -tags mesg -width 2
.c create line 220 1866 300 1866 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1880 -fill #eef -text "155"
.c create line 140 1880 300 1880 -fill #eef -dash {6 4}
.c create line 300 1848 300 1868 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 151 to 155 (Used 1 nobox 1)
# ProcLine[2] stays at 155 (Used 1 nobox 1)
.c create rectangle 226 1870 374 1890 -fill white -width 0
.c create text 300 1880 -text "observe?ORANGE,1"
.c create text 70 1904 -fill #eef -text "157"
.c create line 140 1904 300 1904 -fill #eef -dash {6 4}
.c create line 140 1872 140 1892 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 153 to 157 (Used 1 nobox 1)
# ProcLine[1] stays at 157 (Used 1 nobox 1)
.c create rectangle 66 1894 214 1914 -fill white -width 0
.c create text 140 1904 -text "observe!ORANGE,1"
.c create line 140 1914 220 1914 -fill darkred -tags mesg -width 2
.c create line 220 1914 300 1914 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1928 -fill #eef -text "159"
.c create line 140 1928 300 1928 -fill #eef -dash {6 4}
.c create line 300 1896 300 1916 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 155 to 159 (Used 1 nobox 1)
# ProcLine[2] stays at 159 (Used 1 nobox 1)
.c create rectangle 226 1918 374 1938 -fill white -width 0
.c create text 300 1928 -text "observe?ORANGE,1"
.c create text 70 1952 -fill #eef -text "161"
.c create line 140 1952 300 1952 -fill #eef -dash {6 4}
.c create line 140 1920 140 1940 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 157 to 161 (Used 1 nobox 1)
# ProcLine[1] stays at 161 (Used 1 nobox 1)
.c create rectangle 66 1942 214 1962 -fill white -width 0
.c create text 140 1952 -text "observe!ORANGE,1"
.c create line 140 1962 220 1962 -fill darkred -tags mesg -width 2
.c create line 220 1962 300 1962 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 1976 -fill #eef -text "163"
.c create line 140 1976 300 1976 -fill #eef -dash {6 4}
.c create line 300 1944 300 1964 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 159 to 163 (Used 1 nobox 1)
# ProcLine[2] stays at 163 (Used 1 nobox 1)
.c create rectangle 226 1966 374 1986 -fill white -width 0
.c create text 300 1976 -text "observe?ORANGE,1"
.c create text 70 2000 -fill #eef -text "165"
.c create line 140 2000 300 2000 -fill #eef -dash {6 4}
.c create line 300 1992 300 1988 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 163 to 165 (Used 1 nobox 1)
# ProcLine[2] stays at 165 (Used 1 nobox 1)
.c create rectangle 204 1990 396 2010 -fill white -width 0
.c create text 300 2000 -text "Observateur: ORANGE"
.c create text 70 2024 -fill #eef -text "167"
.c create line 140 2024 300 2024 -fill #eef -dash {6 4}
.c create line 140 1968 140 2012 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 161 to 167 (Used 1 nobox 1)
# ProcLine[1] stays at 167 (Used 1 nobox 1)
.c create rectangle 66 2014 214 2034 -fill white -width 0
.c create text 140 2024 -text "observe!ORANGE,1"
.c create line 140 2034 220 2034 -fill darkred -tags mesg -width 2
.c create line 220 2034 300 2034 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2048 -fill #eef -text "169"
.c create line 140 2048 300 2048 -fill #eef -dash {6 4}
.c create line 300 2016 300 2036 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 165 to 169 (Used 1 nobox 1)
# ProcLine[2] stays at 169 (Used 1 nobox 1)
.c create rectangle 226 2038 374 2058 -fill white -width 0
.c create text 300 2048 -text "observe?ORANGE,1"
.c create text 70 2072 -fill #eef -text "171"
.c create line 140 2072 300 2072 -fill #eef -dash {6 4}
.c create line 140 2040 140 2060 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 167 to 171 (Used 1 nobox 1)
# ProcLine[1] stays at 171 (Used 1 nobox 1)
.c create rectangle 66 2062 214 2082 -fill white -width 0
.c create text 140 2072 -text "observe!ORANGE,1"
.c create line 140 2082 220 2082 -fill darkred -tags mesg -width 2
.c create line 220 2082 300 2082 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2096 -fill #eef -text "173"
.c create line 140 2096 300 2096 -fill #eef -dash {6 4}
.c create line 300 2064 300 2084 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 169 to 173 (Used 1 nobox 1)
# ProcLine[2] stays at 173 (Used 1 nobox 1)
.c create rectangle 226 2086 374 2106 -fill white -width 0
.c create text 300 2096 -text "observe?ORANGE,1"
.c create text 70 2120 -fill #eef -text "175"
.c create line 140 2120 300 2120 -fill #eef -dash {6 4}
.c create line 140 2088 140 2108 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 171 to 175 (Used 1 nobox 1)
# ProcLine[1] stays at 175 (Used 1 nobox 1)
.c create rectangle 66 2110 214 2130 -fill white -width 0
.c create text 140 2120 -text "observe!ORANGE,1"
.c create line 140 2130 220 2130 -fill darkred -tags mesg -width 2
.c create line 220 2130 300 2130 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2144 -fill #eef -text "177"
.c create line 140 2144 300 2144 -fill #eef -dash {6 4}
.c create line 300 2112 300 2132 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 173 to 177 (Used 1 nobox 1)
# ProcLine[2] stays at 177 (Used 1 nobox 1)
.c create rectangle 226 2134 374 2154 -fill white -width 0
.c create text 300 2144 -text "observe?ORANGE,1"
.c create text 70 2168 -fill #eef -text "179"
.c create line 140 2168 300 2168 -fill #eef -dash {6 4}
.c create line 140 2136 140 2156 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 175 to 179 (Used 1 nobox 1)
# ProcLine[1] stays at 179 (Used 1 nobox 1)
.c create rectangle 66 2158 214 2178 -fill white -width 0
.c create text 140 2168 -text "observe!ORANGE,1"
.c create line 140 2178 220 2178 -fill darkred -tags mesg -width 2
.c create line 220 2178 300 2178 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2192 -fill #eef -text "181"
.c create line 140 2192 300 2192 -fill #eef -dash {6 4}
.c create line 300 2160 300 2180 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 177 to 181 (Used 1 nobox 1)
# ProcLine[2] stays at 181 (Used 1 nobox 1)
.c create rectangle 226 2182 374 2202 -fill white -width 0
.c create text 300 2192 -text "observe?ORANGE,1"
.c create text 70 2216 -fill #eef -text "183"
.c create line 140 2216 300 2216 -fill #eef -dash {6 4}
.c create line 140 2184 140 2204 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 179 to 183 (Used 1 nobox 1)
# ProcLine[1] stays at 183 (Used 1 nobox 1)
.c create rectangle 66 2206 214 2226 -fill white -width 0
.c create text 140 2216 -text "observe!ORANGE,1"
.c create line 140 2226 220 2226 -fill darkred -tags mesg -width 2
.c create line 220 2226 300 2226 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2240 -fill #eef -text "185"
.c create line 140 2240 300 2240 -fill #eef -dash {6 4}
.c create line 300 2208 300 2228 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 181 to 185 (Used 1 nobox 1)
# ProcLine[2] stays at 185 (Used 1 nobox 1)
.c create rectangle 226 2230 374 2250 -fill white -width 0
.c create text 300 2240 -text "observe?ORANGE,1"
.c create text 70 2264 -fill #eef -text "187"
.c create line 140 2264 300 2264 -fill #eef -dash {6 4}
.c create line 300 2256 300 2252 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 185 to 187 (Used 1 nobox 1)
# ProcLine[2] stays at 187 (Used 1 nobox 1)
.c create rectangle 204 2254 396 2274 -fill white -width 0
.c create text 300 2264 -text "Observateur: ORANGE"
.c create text 70 2288 -fill #eef -text "189"
.c create line 140 2288 300 2288 -fill #eef -dash {6 4}
.c create line 140 2232 140 2276 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 183 to 189 (Used 1 nobox 1)
# ProcLine[1] stays at 189 (Used 1 nobox 1)
.c create rectangle 66 2278 214 2298 -fill white -width 0
.c create text 140 2288 -text "observe!ORANGE,1"
.c create line 140 2298 220 2298 -fill darkred -tags mesg -width 2
.c create line 220 2298 300 2298 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2312 -fill #eef -text "191"
.c create line 140 2312 300 2312 -fill #eef -dash {6 4}
.c create line 300 2280 300 2300 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 187 to 191 (Used 1 nobox 1)
# ProcLine[2] stays at 191 (Used 1 nobox 1)
.c create rectangle 226 2302 374 2322 -fill white -width 0
.c create text 300 2312 -text "observe?ORANGE,1"
.c create text 70 2336 -fill #eef -text "193"
.c create line 140 2336 300 2336 -fill #eef -dash {6 4}
.c create line 140 2304 140 2324 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 189 to 193 (Used 1 nobox 1)
# ProcLine[1] stays at 193 (Used 1 nobox 1)
.c create rectangle 66 2326 214 2346 -fill white -width 0
.c create text 140 2336 -text "observe!ORANGE,1"
.c create line 140 2346 220 2346 -fill darkred -tags mesg -width 2
.c create line 220 2346 300 2346 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2360 -fill #eef -text "195"
.c create line 140 2360 300 2360 -fill #eef -dash {6 4}
.c create line 300 2328 300 2348 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 191 to 195 (Used 1 nobox 1)
# ProcLine[2] stays at 195 (Used 1 nobox 1)
.c create rectangle 226 2350 374 2370 -fill white -width 0
.c create text 300 2360 -text "observe?ORANGE,1"
.c create text 70 2384 -fill #eef -text "197"
.c create line 140 2384 300 2384 -fill #eef -dash {6 4}
.c create line 300 2376 300 2372 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 195 to 197 (Used 1 nobox 1)
# ProcLine[2] stays at 197 (Used 1 nobox 1)
.c create rectangle 204 2374 396 2394 -fill white -width 0
.c create text 300 2384 -text "Observateur: ORANGE"
.c create text 70 2408 -fill #eef -text "199"
.c create line 140 2408 300 2408 -fill #eef -dash {6 4}
.c create line 140 2352 140 2396 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 193 to 199 (Used 1 nobox 1)
# ProcLine[1] stays at 199 (Used 1 nobox 1)
.c create rectangle 66 2398 214 2418 -fill white -width 0
.c create text 140 2408 -text "observe!ORANGE,1"
.c create line 140 2418 220 2418 -fill darkred -tags mesg -width 2
.c create line 220 2418 300 2418 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2432 -fill #eef -text "201"
.c create line 140 2432 300 2432 -fill #eef -dash {6 4}
.c create line 300 2400 300 2420 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 197 to 201 (Used 1 nobox 1)
# ProcLine[2] stays at 201 (Used 1 nobox 1)
.c create rectangle 226 2422 374 2442 -fill white -width 0
.c create text 300 2432 -text "observe?ORANGE,1"
.c create text 70 2456 -fill #eef -text "203"
.c create line 140 2456 300 2456 -fill #eef -dash {6 4}
.c create line 300 2448 300 2444 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 201 to 203 (Used 1 nobox 1)
# ProcLine[2] stays at 203 (Used 1 nobox 1)
.c create rectangle 204 2446 396 2466 -fill white -width 0
.c create text 300 2456 -text "Observateur: ORANGE"
.c create text 70 2480 -fill #eef -text "205"
.c create line 140 2480 300 2480 -fill #eef -dash {6 4}
.c create line 140 2424 140 2468 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 199 to 205 (Used 1 nobox 1)
# ProcLine[1] stays at 205 (Used 1 nobox 1)
.c create rectangle 66 2470 214 2490 -fill white -width 0
.c create text 140 2480 -text "observe!ORANGE,1"
.c create line 140 2490 220 2490 -fill darkred -tags mesg -width 2
.c create line 220 2490 300 2490 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2504 -fill #eef -text "207"
.c create line 140 2504 300 2504 -fill #eef -dash {6 4}
.c create line 300 2472 300 2492 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 203 to 207 (Used 1 nobox 1)
# ProcLine[2] stays at 207 (Used 1 nobox 1)
.c create rectangle 226 2494 374 2514 -fill white -width 0
.c create text 300 2504 -text "observe?ORANGE,1"
.c create text 70 2528 -fill #eef -text "209"
.c create line 140 2528 300 2528 -fill #eef -dash {6 4}
.c create line 140 2496 140 2516 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 205 to 209 (Used 1 nobox 1)
# ProcLine[1] stays at 209 (Used 1 nobox 1)
.c create rectangle 66 2518 214 2538 -fill white -width 0
.c create text 140 2528 -text "observe!ORANGE,1"
.c create line 140 2538 220 2538 -fill darkred -tags mesg -width 2
.c create line 220 2538 300 2538 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2552 -fill #eef -text "211"
.c create line 140 2552 300 2552 -fill #eef -dash {6 4}
.c create line 300 2520 300 2540 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 207 to 211 (Used 1 nobox 1)
# ProcLine[2] stays at 211 (Used 1 nobox 1)
.c create rectangle 226 2542 374 2562 -fill white -width 0
.c create text 300 2552 -text "observe?ORANGE,1"
.c create text 70 2576 -fill #eef -text "213"
.c create line 140 2576 300 2576 -fill #eef -dash {6 4}
.c create line 140 2544 140 2564 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 209 to 213 (Used 1 nobox 1)
# ProcLine[1] stays at 213 (Used 1 nobox 1)
.c create rectangle 66 2566 214 2586 -fill white -width 0
.c create text 140 2576 -text "observe!ORANGE,1"
.c create line 140 2586 220 2586 -fill darkred -tags mesg -width 2
.c create line 220 2586 300 2586 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2600 -fill #eef -text "215"
.c create line 140 2600 300 2600 -fill #eef -dash {6 4}
.c create line 300 2568 300 2588 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 211 to 215 (Used 1 nobox 1)
# ProcLine[2] stays at 215 (Used 1 nobox 1)
.c create rectangle 226 2590 374 2610 -fill white -width 0
.c create text 300 2600 -text "observe?ORANGE,1"
.c create text 70 2624 -fill #eef -text "217"
.c create line 140 2624 300 2624 -fill #eef -dash {6 4}
.c create line 140 2592 140 2612 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 213 to 217 (Used 1 nobox 1)
# ProcLine[1] stays at 217 (Used 1 nobox 1)
.c create rectangle 66 2614 214 2634 -fill white -width 0
.c create text 140 2624 -text "observe!ORANGE,1"
.c create line 140 2634 220 2634 -fill darkred -tags mesg -width 2
.c create line 220 2634 300 2634 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2648 -fill #eef -text "219"
.c create line 140 2648 300 2648 -fill #eef -dash {6 4}
.c create line 300 2616 300 2636 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 215 to 219 (Used 1 nobox 1)
# ProcLine[2] stays at 219 (Used 1 nobox 1)
.c create rectangle 226 2638 374 2658 -fill white -width 0
.c create text 300 2648 -text "observe?ORANGE,1"
.c create text 70 2672 -fill #eef -text "221"
.c create line 140 2672 300 2672 -fill #eef -dash {6 4}
.c create line 140 2640 140 2660 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 217 to 221 (Used 1 nobox 1)
# ProcLine[1] stays at 221 (Used 1 nobox 1)
.c create rectangle 66 2662 214 2682 -fill white -width 0
.c create text 140 2672 -text "observe!ORANGE,1"
.c create line 140 2682 220 2682 -fill darkred -tags mesg -width 2
.c create line 220 2682 300 2682 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2696 -fill #eef -text "223"
.c create line 140 2696 300 2696 -fill #eef -dash {6 4}
.c create line 300 2664 300 2684 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 219 to 223 (Used 1 nobox 1)
# ProcLine[2] stays at 223 (Used 1 nobox 1)
.c create rectangle 226 2686 374 2706 -fill white -width 0
.c create text 300 2696 -text "observe?ORANGE,1"
.c create text 70 2720 -fill #eef -text "225"
.c create line 140 2720 300 2720 -fill #eef -dash {6 4}
.c create line 140 2688 140 2708 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 221 to 225 (Used 1 nobox 1)
# ProcLine[1] stays at 225 (Used 1 nobox 1)
.c create rectangle 66 2710 214 2730 -fill white -width 0
.c create text 140 2720 -text "observe!ORANGE,1"
.c create line 140 2730 220 2730 -fill darkred -tags mesg -width 2
.c create line 220 2730 300 2730 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2744 -fill #eef -text "227"
.c create line 140 2744 300 2744 -fill #eef -dash {6 4}
.c create line 300 2712 300 2732 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 223 to 227 (Used 1 nobox 1)
# ProcLine[2] stays at 227 (Used 1 nobox 1)
.c create rectangle 226 2734 374 2754 -fill white -width 0
.c create text 300 2744 -text "observe?ORANGE,1"
.c create text 70 2768 -fill #eef -text "229"
.c create line 140 2768 300 2768 -fill #eef -dash {6 4}
.c create line 140 2736 140 2756 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 225 to 229 (Used 1 nobox 1)
# ProcLine[1] stays at 229 (Used 1 nobox 1)
.c create rectangle 66 2758 214 2778 -fill white -width 0
.c create text 140 2768 -text "observe!ORANGE,1"
.c create line 140 2778 220 2778 -fill darkred -tags mesg -width 2
.c create line 220 2778 300 2778 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2792 -fill #eef -text "231"
.c create line 140 2792 300 2792 -fill #eef -dash {6 4}
.c create line 300 2760 300 2780 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 227 to 231 (Used 1 nobox 1)
# ProcLine[2] stays at 231 (Used 1 nobox 1)
.c create rectangle 226 2782 374 2802 -fill white -width 0
.c create text 300 2792 -text "observe?ORANGE,1"
.c create text 70 2816 -fill #eef -text "233"
.c create line 140 2816 300 2816 -fill #eef -dash {6 4}
.c create line 140 2784 140 2804 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 229 to 233 (Used 1 nobox 1)
# ProcLine[1] stays at 233 (Used 1 nobox 1)
.c create rectangle 66 2806 214 2826 -fill white -width 0
.c create text 140 2816 -text "observe!ORANGE,1"
.c create line 140 2826 220 2826 -fill darkred -tags mesg -width 2
.c create line 220 2826 300 2826 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2840 -fill #eef -text "235"
.c create line 140 2840 300 2840 -fill #eef -dash {6 4}
.c create line 300 2808 300 2828 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 231 to 235 (Used 1 nobox 1)
# ProcLine[2] stays at 235 (Used 1 nobox 1)
.c create rectangle 226 2830 374 2850 -fill white -width 0
.c create text 300 2840 -text "observe?ORANGE,1"
.c create text 70 2864 -fill #eef -text "237"
.c create line 140 2864 300 2864 -fill #eef -dash {6 4}
.c create line 140 2832 140 2852 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 233 to 237 (Used 1 nobox 1)
# ProcLine[1] stays at 237 (Used 1 nobox 1)
.c create rectangle 66 2854 214 2874 -fill white -width 0
.c create text 140 2864 -text "observe!ORANGE,1"
.c create line 140 2874 220 2874 -fill darkred -tags mesg -width 2
.c create line 220 2874 300 2874 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2888 -fill #eef -text "239"
.c create line 140 2888 300 2888 -fill #eef -dash {6 4}
.c create line 300 2856 300 2876 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 235 to 239 (Used 1 nobox 1)
# ProcLine[2] stays at 239 (Used 1 nobox 1)
.c create rectangle 226 2878 374 2898 -fill white -width 0
.c create text 300 2888 -text "observe?ORANGE,1"
.c create text 70 2912 -fill #eef -text "241"
.c create line 140 2912 300 2912 -fill #eef -dash {6 4}
.c create line 140 2880 140 2900 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 237 to 241 (Used 1 nobox 1)
# ProcLine[1] stays at 241 (Used 1 nobox 1)
.c create rectangle 66 2902 214 2922 -fill white -width 0
.c create text 140 2912 -text "observe!ORANGE,1"
.c create line 140 2922 220 2922 -fill darkred -tags mesg -width 2
.c create line 220 2922 300 2922 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2936 -fill #eef -text "243"
.c create line 140 2936 300 2936 -fill #eef -dash {6 4}
.c create line 300 2904 300 2924 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 239 to 243 (Used 1 nobox 1)
# ProcLine[2] stays at 243 (Used 1 nobox 1)
.c create rectangle 226 2926 374 2946 -fill white -width 0
.c create text 300 2936 -text "observe?ORANGE,1"
.c create text 70 2960 -fill #eef -text "245"
.c create line 140 2960 300 2960 -fill #eef -dash {6 4}
.c create line 140 2928 140 2948 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 241 to 245 (Used 1 nobox 1)
# ProcLine[1] stays at 245 (Used 1 nobox 1)
.c create rectangle 66 2950 214 2970 -fill white -width 0
.c create text 140 2960 -text "observe!ORANGE,1"
.c create line 140 2970 220 2970 -fill darkred -tags mesg -width 2
.c create line 220 2970 300 2970 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 2984 -fill #eef -text "247"
.c create line 140 2984 300 2984 -fill #eef -dash {6 4}
.c create line 300 2952 300 2972 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 243 to 247 (Used 1 nobox 1)
# ProcLine[2] stays at 247 (Used 1 nobox 1)
.c create rectangle 226 2974 374 2994 -fill white -width 0
.c create text 300 2984 -text "observe?ORANGE,1"
.c create text 70 3008 -fill #eef -text "249"
.c create line 140 3008 300 3008 -fill #eef -dash {6 4}
.c create line 300 3000 300 2996 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 247 to 249 (Used 1 nobox 1)
# ProcLine[2] stays at 249 (Used 1 nobox 1)
.c create rectangle 204 2998 396 3018 -fill white -width 0
.c create text 300 3008 -text "Observateur: ORANGE"
.c create text 70 3032 -fill #eef -text "251"
.c create line 140 3032 300 3032 -fill #eef -dash {6 4}
.c create line 140 2976 140 3020 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 245 to 251 (Used 1 nobox 1)
# ProcLine[1] stays at 251 (Used 1 nobox 1)
.c create rectangle 66 3022 214 3042 -fill white -width 0
.c create text 140 3032 -text "observe!ORANGE,1"
.c create line 140 3042 220 3042 -fill darkred -tags mesg -width 2
.c create line 220 3042 300 3042 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3056 -fill #eef -text "253"
.c create line 140 3056 300 3056 -fill #eef -dash {6 4}
.c create line 300 3024 300 3044 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 249 to 253 (Used 1 nobox 1)
# ProcLine[2] stays at 253 (Used 1 nobox 1)
.c create rectangle 226 3046 374 3066 -fill white -width 0
.c create text 300 3056 -text "observe?ORANGE,1"
.c create text 70 3080 -fill #eef -text "255"
.c create line 140 3080 300 3080 -fill #eef -dash {6 4}
.c create line 140 3048 140 3068 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 251 to 255 (Used 1 nobox 1)
# ProcLine[1] stays at 255 (Used 1 nobox 1)
.c create rectangle 66 3070 214 3090 -fill white -width 0
.c create text 140 3080 -text "observe!ORANGE,1"
.c create line 140 3090 220 3090 -fill darkred -tags mesg -width 2
.c create line 220 3090 300 3090 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3104 -fill #eef -text "257"
.c create line 140 3104 300 3104 -fill #eef -dash {6 4}
.c create line 300 3072 300 3092 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 253 to 257 (Used 1 nobox 1)
# ProcLine[2] stays at 257 (Used 1 nobox 1)
.c create rectangle 226 3094 374 3114 -fill white -width 0
.c create text 300 3104 -text "observe?ORANGE,1"
.c create text 70 3128 -fill #eef -text "259"
.c create line 140 3128 300 3128 -fill #eef -dash {6 4}
.c create line 140 3096 140 3116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 255 to 259 (Used 1 nobox 1)
# ProcLine[1] stays at 259 (Used 1 nobox 1)
.c create rectangle 66 3118 214 3138 -fill white -width 0
.c create text 140 3128 -text "observe!ORANGE,1"
.c create line 140 3138 220 3138 -fill darkred -tags mesg -width 2
.c create line 220 3138 300 3138 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3152 -fill #eef -text "261"
.c create line 140 3152 300 3152 -fill #eef -dash {6 4}
.c create line 300 3120 300 3140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 257 to 261 (Used 1 nobox 1)
# ProcLine[2] stays at 261 (Used 1 nobox 1)
.c create rectangle 226 3142 374 3162 -fill white -width 0
.c create text 300 3152 -text "observe?ORANGE,1"
.c create text 70 3176 -fill #eef -text "263"
.c create line 140 3176 300 3176 -fill #eef -dash {6 4}
.c create line 140 3144 140 3164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 259 to 263 (Used 1 nobox 1)
# ProcLine[1] stays at 263 (Used 1 nobox 1)
.c create rectangle 66 3166 214 3186 -fill white -width 0
.c create text 140 3176 -text "observe!ORANGE,1"
.c create line 140 3186 220 3186 -fill darkred -tags mesg -width 2
.c create line 220 3186 300 3186 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3200 -fill #eef -text "265"
.c create line 140 3200 300 3200 -fill #eef -dash {6 4}
.c create line 300 3168 300 3188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 261 to 265 (Used 1 nobox 1)
# ProcLine[2] stays at 265 (Used 1 nobox 1)
.c create rectangle 226 3190 374 3210 -fill white -width 0
.c create text 300 3200 -text "observe?ORANGE,1"
.c create text 70 3224 -fill #eef -text "267"
.c create line 140 3224 300 3224 -fill #eef -dash {6 4}
.c create line 140 3192 140 3212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 263 to 267 (Used 1 nobox 1)
# ProcLine[1] stays at 267 (Used 1 nobox 1)
.c create rectangle 66 3214 214 3234 -fill white -width 0
.c create text 140 3224 -text "observe!ORANGE,1"
.c create line 140 3234 220 3234 -fill darkred -tags mesg -width 2
.c create line 220 3234 300 3234 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3248 -fill #eef -text "269"
.c create line 140 3248 300 3248 -fill #eef -dash {6 4}
.c create line 300 3216 300 3236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 265 to 269 (Used 1 nobox 1)
# ProcLine[2] stays at 269 (Used 1 nobox 1)
.c create rectangle 226 3238 374 3258 -fill white -width 0
.c create text 300 3248 -text "observe?ORANGE,1"
.c create text 70 3272 -fill #eef -text "271"
.c create line 140 3272 300 3272 -fill #eef -dash {6 4}
.c create line 140 3240 140 3260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 267 to 271 (Used 1 nobox 1)
# ProcLine[1] stays at 271 (Used 1 nobox 1)
.c create rectangle 66 3262 214 3282 -fill white -width 0
.c create text 140 3272 -text "observe!ORANGE,1"
.c create line 140 3282 220 3282 -fill darkred -tags mesg -width 2
.c create line 220 3282 300 3282 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3296 -fill #eef -text "273"
.c create line 140 3296 300 3296 -fill #eef -dash {6 4}
.c create line 300 3264 300 3284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 269 to 273 (Used 1 nobox 1)
# ProcLine[2] stays at 273 (Used 1 nobox 1)
.c create rectangle 226 3286 374 3306 -fill white -width 0
.c create text 300 3296 -text "observe?ORANGE,1"
.c create text 70 3320 -fill #eef -text "275"
.c create line 140 3320 300 3320 -fill #eef -dash {6 4}
.c create line 140 3288 140 3308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 271 to 275 (Used 1 nobox 1)
# ProcLine[1] stays at 275 (Used 1 nobox 1)
.c create rectangle 66 3310 214 3330 -fill white -width 0
.c create text 140 3320 -text "observe!ORANGE,1"
.c create line 140 3330 220 3330 -fill darkred -tags mesg -width 2
.c create line 220 3330 300 3330 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3344 -fill #eef -text "277"
.c create line 140 3344 300 3344 -fill #eef -dash {6 4}
.c create line 300 3312 300 3332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 273 to 277 (Used 1 nobox 1)
# ProcLine[2] stays at 277 (Used 1 nobox 1)
.c create rectangle 226 3334 374 3354 -fill white -width 0
.c create text 300 3344 -text "observe?ORANGE,1"
.c create text 70 3368 -fill #eef -text "279"
.c create line 140 3368 300 3368 -fill #eef -dash {6 4}
.c create line 140 3336 140 3356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 275 to 279 (Used 1 nobox 1)
# ProcLine[1] stays at 279 (Used 1 nobox 1)
.c create rectangle 66 3358 214 3378 -fill white -width 0
.c create text 140 3368 -text "observe!ORANGE,1"
.c create line 140 3378 220 3378 -fill darkred -tags mesg -width 2
.c create line 220 3378 300 3378 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3392 -fill #eef -text "281"
.c create line 140 3392 300 3392 -fill #eef -dash {6 4}
.c create line 300 3360 300 3380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 277 to 281 (Used 1 nobox 1)
# ProcLine[2] stays at 281 (Used 1 nobox 1)
.c create rectangle 226 3382 374 3402 -fill white -width 0
.c create text 300 3392 -text "observe?ORANGE,1"
.c create text 70 3416 -fill #eef -text "283"
.c create line 140 3416 300 3416 -fill #eef -dash {6 4}
.c create line 140 3384 140 3404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 279 to 283 (Used 1 nobox 1)
# ProcLine[1] stays at 283 (Used 1 nobox 1)
.c create rectangle 66 3406 214 3426 -fill white -width 0
.c create text 140 3416 -text "observe!ORANGE,1"
.c create line 140 3426 220 3426 -fill darkred -tags mesg -width 2
.c create line 220 3426 300 3426 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3440 -fill #eef -text "285"
.c create line 140 3440 300 3440 -fill #eef -dash {6 4}
.c create line 300 3408 300 3428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 281 to 285 (Used 1 nobox 1)
# ProcLine[2] stays at 285 (Used 1 nobox 1)
.c create rectangle 226 3430 374 3450 -fill white -width 0
.c create text 300 3440 -text "observe?ORANGE,1"
.c create text 70 3464 -fill #eef -text "287"
.c create line 140 3464 300 3464 -fill #eef -dash {6 4}
.c create line 140 3432 140 3452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 283 to 287 (Used 1 nobox 1)
# ProcLine[1] stays at 287 (Used 1 nobox 1)
.c create rectangle 66 3454 214 3474 -fill white -width 0
.c create text 140 3464 -text "observe!ORANGE,1"
.c create line 140 3474 220 3474 -fill darkred -tags mesg -width 2
.c create line 220 3474 300 3474 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3488 -fill #eef -text "289"
.c create line 140 3488 300 3488 -fill #eef -dash {6 4}
.c create line 300 3456 300 3476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 285 to 289 (Used 1 nobox 1)
# ProcLine[2] stays at 289 (Used 1 nobox 1)
.c create rectangle 226 3478 374 3498 -fill white -width 0
.c create text 300 3488 -text "observe?ORANGE,1"
.c create text 70 3512 -fill #eef -text "291"
.c create line 140 3512 300 3512 -fill #eef -dash {6 4}
.c create line 140 3480 140 3500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 287 to 291 (Used 1 nobox 1)
# ProcLine[1] stays at 291 (Used 1 nobox 1)
.c create rectangle 66 3502 214 3522 -fill white -width 0
.c create text 140 3512 -text "observe!ORANGE,1"
.c create line 140 3522 220 3522 -fill darkred -tags mesg -width 2
.c create line 220 3522 300 3522 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3536 -fill #eef -text "293"
.c create line 140 3536 300 3536 -fill #eef -dash {6 4}
.c create line 300 3504 300 3524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 289 to 293 (Used 1 nobox 1)
# ProcLine[2] stays at 293 (Used 1 nobox 1)
.c create rectangle 226 3526 374 3546 -fill white -width 0
.c create text 300 3536 -text "observe?ORANGE,1"
.c create text 70 3560 -fill #eef -text "295"
.c create line 140 3560 300 3560 -fill #eef -dash {6 4}
.c create line 140 3528 140 3548 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 291 to 295 (Used 1 nobox 1)
# ProcLine[1] stays at 295 (Used 1 nobox 1)
.c create rectangle 66 3550 214 3570 -fill white -width 0
.c create text 140 3560 -text "observe!ORANGE,1"
.c create line 140 3570 220 3570 -fill darkred -tags mesg -width 2
.c create line 220 3570 300 3570 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3584 -fill #eef -text "297"
.c create line 140 3584 300 3584 -fill #eef -dash {6 4}
.c create line 300 3552 300 3572 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 293 to 297 (Used 1 nobox 1)
# ProcLine[2] stays at 297 (Used 1 nobox 1)
.c create rectangle 226 3574 374 3594 -fill white -width 0
.c create text 300 3584 -text "observe?ORANGE,1"
.c create text 70 3608 -fill #eef -text "299"
.c create line 140 3608 300 3608 -fill #eef -dash {6 4}
.c create line 140 3576 140 3596 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 295 to 299 (Used 1 nobox 1)
# ProcLine[1] stays at 299 (Used 1 nobox 1)
.c create rectangle 66 3598 214 3618 -fill white -width 0
.c create text 140 3608 -text "observe!ORANGE,1"
.c create line 140 3618 220 3618 -fill darkred -tags mesg -width 2
.c create line 220 3618 300 3618 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3632 -fill #eef -text "301"
.c create line 140 3632 300 3632 -fill #eef -dash {6 4}
.c create line 300 3600 300 3620 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 297 to 301 (Used 1 nobox 1)
# ProcLine[2] stays at 301 (Used 1 nobox 1)
.c create rectangle 226 3622 374 3642 -fill white -width 0
.c create text 300 3632 -text "observe?ORANGE,1"
.c create text 70 3656 -fill #eef -text "303"
.c create line 140 3656 300 3656 -fill #eef -dash {6 4}
.c create line 300 3648 300 3644 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 301 to 303 (Used 1 nobox 1)
# ProcLine[2] stays at 303 (Used 1 nobox 1)
.c create rectangle 204 3646 396 3666 -fill white -width 0
.c create text 300 3656 -text "Observateur: ORANGE"
.c create text 70 3680 -fill #eef -text "305"
.c create line 140 3680 300 3680 -fill #eef -dash {6 4}
.c create line 140 3624 140 3668 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 299 to 305 (Used 1 nobox 1)
# ProcLine[1] stays at 305 (Used 1 nobox 1)
.c create rectangle 66 3670 214 3690 -fill white -width 0
.c create text 140 3680 -text "observe!ORANGE,1"
.c create line 140 3690 220 3690 -fill darkred -tags mesg -width 2
.c create line 220 3690 300 3690 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3704 -fill #eef -text "307"
.c create line 140 3704 300 3704 -fill #eef -dash {6 4}
.c create line 300 3672 300 3692 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 303 to 307 (Used 1 nobox 1)
# ProcLine[2] stays at 307 (Used 1 nobox 1)
.c create rectangle 226 3694 374 3714 -fill white -width 0
.c create text 300 3704 -text "observe?ORANGE,1"
.c create text 70 3728 -fill #eef -text "309"
.c create line 140 3728 300 3728 -fill #eef -dash {6 4}
.c create line 140 3696 140 3716 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 305 to 309 (Used 1 nobox 1)
# ProcLine[1] stays at 309 (Used 1 nobox 1)
.c create rectangle 66 3718 214 3738 -fill white -width 0
.c create text 140 3728 -text "observe!ORANGE,1"
.c create line 140 3738 220 3738 -fill darkred -tags mesg -width 2
.c create line 220 3738 300 3738 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3752 -fill #eef -text "311"
.c create line 140 3752 300 3752 -fill #eef -dash {6 4}
.c create line 300 3720 300 3740 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 307 to 311 (Used 1 nobox 1)
# ProcLine[2] stays at 311 (Used 1 nobox 1)
.c create rectangle 226 3742 374 3762 -fill white -width 0
.c create text 300 3752 -text "observe?ORANGE,1"
.c create text 70 3776 -fill #eef -text "313"
.c create line 140 3776 300 3776 -fill #eef -dash {6 4}
.c create line 140 3744 140 3764 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 309 to 313 (Used 1 nobox 1)
# ProcLine[1] stays at 313 (Used 1 nobox 1)
.c create rectangle 66 3766 214 3786 -fill white -width 0
.c create text 140 3776 -text "observe!ORANGE,1"
.c create line 140 3786 220 3786 -fill darkred -tags mesg -width 2
.c create line 220 3786 300 3786 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3800 -fill #eef -text "315"
.c create line 140 3800 300 3800 -fill #eef -dash {6 4}
.c create line 300 3768 300 3788 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 311 to 315 (Used 1 nobox 1)
# ProcLine[2] stays at 315 (Used 1 nobox 1)
.c create rectangle 226 3790 374 3810 -fill white -width 0
.c create text 300 3800 -text "observe?ORANGE,1"
.c create text 70 3824 -fill #eef -text "317"
.c create line 140 3824 300 3824 -fill #eef -dash {6 4}
.c create line 140 3792 140 3812 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 313 to 317 (Used 1 nobox 1)
# ProcLine[1] stays at 317 (Used 1 nobox 1)
.c create rectangle 66 3814 214 3834 -fill white -width 0
.c create text 140 3824 -text "observe!ORANGE,1"
.c create line 140 3834 220 3834 -fill darkred -tags mesg -width 2
.c create line 220 3834 300 3834 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3848 -fill #eef -text "319"
.c create line 140 3848 300 3848 -fill #eef -dash {6 4}
.c create line 300 3816 300 3836 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 315 to 319 (Used 1 nobox 1)
# ProcLine[2] stays at 319 (Used 1 nobox 1)
.c create rectangle 226 3838 374 3858 -fill white -width 0
.c create text 300 3848 -text "observe?ORANGE,1"
.c create text 70 3872 -fill #eef -text "321"
.c create line 140 3872 300 3872 -fill #eef -dash {6 4}
.c create line 140 3840 140 3860 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 317 to 321 (Used 1 nobox 1)
# ProcLine[1] stays at 321 (Used 1 nobox 1)
.c create rectangle 66 3862 214 3882 -fill white -width 0
.c create text 140 3872 -text "observe!ORANGE,1"
.c create line 140 3882 220 3882 -fill darkred -tags mesg -width 2
.c create line 220 3882 300 3882 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3896 -fill #eef -text "323"
.c create line 140 3896 300 3896 -fill #eef -dash {6 4}
.c create line 300 3864 300 3884 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 319 to 323 (Used 1 nobox 1)
# ProcLine[2] stays at 323 (Used 1 nobox 1)
.c create rectangle 226 3886 374 3906 -fill white -width 0
.c create text 300 3896 -text "observe?ORANGE,1"
.c create text 70 3920 -fill #eef -text "325"
.c create line 140 3920 300 3920 -fill #eef -dash {6 4}
.c create line 300 3912 300 3908 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 323 to 325 (Used 1 nobox 1)
# ProcLine[2] stays at 325 (Used 1 nobox 1)
.c create rectangle 204 3910 396 3930 -fill white -width 0
.c create text 300 3920 -text "Observateur: ORANGE"
.c create text 70 3944 -fill #eef -text "327"
.c create line 140 3944 300 3944 -fill #eef -dash {6 4}
.c create line 140 3888 140 3932 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 321 to 327 (Used 1 nobox 1)
# ProcLine[1] stays at 327 (Used 1 nobox 1)
.c create rectangle 66 3934 214 3954 -fill white -width 0
.c create text 140 3944 -text "observe!ORANGE,1"
.c create line 140 3954 220 3954 -fill darkred -tags mesg -width 2
.c create line 220 3954 300 3954 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 3968 -fill #eef -text "329"
.c create line 140 3968 300 3968 -fill #eef -dash {6 4}
.c create line 300 3936 300 3956 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 325 to 329 (Used 1 nobox 1)
# ProcLine[2] stays at 329 (Used 1 nobox 1)
.c create rectangle 226 3958 374 3978 -fill white -width 0
.c create text 300 3968 -text "observe?ORANGE,1"
.c create text 70 3992 -fill #eef -text "331"
.c create line 140 3992 300 3992 -fill #eef -dash {6 4}
.c create line 300 3984 300 3980 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 329 to 331 (Used 1 nobox 1)
# ProcLine[2] stays at 331 (Used 1 nobox 1)
.c create rectangle 204 3982 396 4002 -fill white -width 0
.c create text 300 3992 -text "Observateur: ORANGE"
.c create text 70 4016 -fill #eef -text "333"
.c create line 140 4016 300 4016 -fill #eef -dash {6 4}
.c create line 140 3960 140 4004 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 327 to 333 (Used 1 nobox 1)
# ProcLine[1] stays at 333 (Used 1 nobox 1)
.c create rectangle 66 4006 214 4026 -fill white -width 0
.c create text 140 4016 -text "observe!ORANGE,1"
.c create line 140 4026 220 4026 -fill darkred -tags mesg -width 2
.c create line 220 4026 300 4026 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4040 -fill #eef -text "335"
.c create line 140 4040 300 4040 -fill #eef -dash {6 4}
.c create line 300 4008 300 4028 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 331 to 335 (Used 1 nobox 1)
# ProcLine[2] stays at 335 (Used 1 nobox 1)
.c create rectangle 226 4030 374 4050 -fill white -width 0
.c create text 300 4040 -text "observe?ORANGE,1"
.c create text 70 4064 -fill #eef -text "337"
.c create line 140 4064 300 4064 -fill #eef -dash {6 4}
.c create line 140 4032 140 4052 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 333 to 337 (Used 1 nobox 1)
# ProcLine[1] stays at 337 (Used 1 nobox 1)
.c create rectangle 66 4054 214 4074 -fill white -width 0
.c create text 140 4064 -text "observe!ORANGE,1"
.c create line 140 4074 220 4074 -fill darkred -tags mesg -width 2
.c create line 220 4074 300 4074 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4088 -fill #eef -text "339"
.c create line 140 4088 300 4088 -fill #eef -dash {6 4}
.c create line 300 4056 300 4076 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 335 to 339 (Used 1 nobox 1)
# ProcLine[2] stays at 339 (Used 1 nobox 1)
.c create rectangle 226 4078 374 4098 -fill white -width 0
.c create text 300 4088 -text "observe?ORANGE,1"
.c create text 70 4112 -fill #eef -text "341"
.c create line 140 4112 300 4112 -fill #eef -dash {6 4}
.c create line 300 4104 300 4100 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 339 to 341 (Used 1 nobox 1)
# ProcLine[2] stays at 341 (Used 1 nobox 1)
.c create rectangle 204 4102 396 4122 -fill white -width 0
.c create text 300 4112 -text "Observateur: ORANGE"
.c create text 70 4136 -fill #eef -text "343"
.c create line 140 4136 300 4136 -fill #eef -dash {6 4}
.c create line 140 4080 140 4124 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 337 to 343 (Used 1 nobox 1)
# ProcLine[1] stays at 343 (Used 1 nobox 1)
.c create rectangle 66 4126 214 4146 -fill white -width 0
.c create text 140 4136 -text "observe!ORANGE,1"
.c create line 140 4146 220 4146 -fill darkred -tags mesg -width 2
.c create line 220 4146 300 4146 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4160 -fill #eef -text "345"
.c create line 140 4160 300 4160 -fill #eef -dash {6 4}
.c create line 300 4128 300 4148 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 341 to 345 (Used 1 nobox 1)
# ProcLine[2] stays at 345 (Used 1 nobox 1)
.c create rectangle 226 4150 374 4170 -fill white -width 0
.c create text 300 4160 -text "observe?ORANGE,1"
.c create text 70 4184 -fill #eef -text "347"
.c create line 140 4184 300 4184 -fill #eef -dash {6 4}
.c create line 300 4176 300 4172 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 345 to 347 (Used 1 nobox 1)
# ProcLine[2] stays at 347 (Used 1 nobox 1)
.c create rectangle 204 4174 396 4194 -fill white -width 0
.c create text 300 4184 -text "Observateur: ORANGE"
.c create text 70 4208 -fill #eef -text "349"
.c create line 140 4208 300 4208 -fill #eef -dash {6 4}
.c create line 140 4152 140 4196 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 343 to 349 (Used 1 nobox 1)
# ProcLine[1] stays at 349 (Used 1 nobox 1)
.c create rectangle 66 4198 214 4218 -fill white -width 0
.c create text 140 4208 -text "observe!ORANGE,1"
.c create line 140 4218 220 4218 -fill darkred -tags mesg -width 2
.c create line 220 4218 300 4218 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4232 -fill #eef -text "351"
.c create line 140 4232 300 4232 -fill #eef -dash {6 4}
.c create line 300 4200 300 4220 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 347 to 351 (Used 1 nobox 1)
# ProcLine[2] stays at 351 (Used 1 nobox 1)
.c create rectangle 226 4222 374 4242 -fill white -width 0
.c create text 300 4232 -text "observe?ORANGE,1"
.c create text 70 4256 -fill #eef -text "353"
.c create line 140 4256 300 4256 -fill #eef -dash {6 4}
.c create line 140 4224 140 4244 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 349 to 353 (Used 1 nobox 1)
# ProcLine[1] stays at 353 (Used 1 nobox 1)
.c create rectangle 66 4246 214 4266 -fill white -width 0
.c create text 140 4256 -text "observe!ORANGE,1"
.c create line 140 4266 220 4266 -fill darkred -tags mesg -width 2
.c create line 220 4266 300 4266 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4280 -fill #eef -text "355"
.c create line 140 4280 300 4280 -fill #eef -dash {6 4}
.c create line 300 4248 300 4268 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 351 to 355 (Used 1 nobox 1)
# ProcLine[2] stays at 355 (Used 1 nobox 1)
.c create rectangle 226 4270 374 4290 -fill white -width 0
.c create text 300 4280 -text "observe?ORANGE,1"
.c create text 70 4304 -fill #eef -text "357"
.c create line 140 4304 300 4304 -fill #eef -dash {6 4}
.c create line 140 4272 140 4292 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 353 to 357 (Used 1 nobox 1)
# ProcLine[1] stays at 357 (Used 1 nobox 1)
.c create rectangle 66 4294 214 4314 -fill white -width 0
.c create text 140 4304 -text "observe!ORANGE,1"
.c create line 140 4314 220 4314 -fill darkred -tags mesg -width 2
.c create line 220 4314 300 4314 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4328 -fill #eef -text "359"
.c create line 140 4328 300 4328 -fill #eef -dash {6 4}
.c create line 300 4296 300 4316 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 355 to 359 (Used 1 nobox 1)
# ProcLine[2] stays at 359 (Used 1 nobox 1)
.c create rectangle 226 4318 374 4338 -fill white -width 0
.c create text 300 4328 -text "observe?ORANGE,1"
.c create text 70 4352 -fill #eef -text "361"
.c create line 140 4352 300 4352 -fill #eef -dash {6 4}
.c create line 140 4320 140 4340 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 357 to 361 (Used 1 nobox 1)
# ProcLine[1] stays at 361 (Used 1 nobox 1)
.c create rectangle 66 4342 214 4362 -fill white -width 0
.c create text 140 4352 -text "observe!ORANGE,1"
.c create line 140 4362 220 4362 -fill darkred -tags mesg -width 2
.c create line 220 4362 300 4362 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4376 -fill #eef -text "363"
.c create line 140 4376 300 4376 -fill #eef -dash {6 4}
.c create line 300 4344 300 4364 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 359 to 363 (Used 1 nobox 1)
# ProcLine[2] stays at 363 (Used 1 nobox 1)
.c create rectangle 226 4366 374 4386 -fill white -width 0
.c create text 300 4376 -text "observe?ORANGE,1"
.c create text 70 4400 -fill #eef -text "365"
.c create line 140 4400 300 4400 -fill #eef -dash {6 4}
.c create line 300 4392 300 4388 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 363 to 365 (Used 1 nobox 1)
# ProcLine[2] stays at 365 (Used 1 nobox 1)
.c create rectangle 204 4390 396 4410 -fill white -width 0
.c create text 300 4400 -text "Observateur: ORANGE"
.c create text 70 4424 -fill #eef -text "367"
.c create line 140 4424 300 4424 -fill #eef -dash {6 4}
.c create line 140 4368 140 4412 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 361 to 367 (Used 1 nobox 1)
# ProcLine[1] stays at 367 (Used 1 nobox 1)
.c create rectangle 66 4414 214 4434 -fill white -width 0
.c create text 140 4424 -text "observe!ORANGE,1"
.c create line 140 4434 220 4434 -fill darkred -tags mesg -width 2
.c create line 220 4434 300 4434 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4448 -fill #eef -text "369"
.c create line 140 4448 300 4448 -fill #eef -dash {6 4}
.c create line 300 4416 300 4436 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 365 to 369 (Used 1 nobox 1)
# ProcLine[2] stays at 369 (Used 1 nobox 1)
.c create rectangle 226 4438 374 4458 -fill white -width 0
.c create text 300 4448 -text "observe?ORANGE,1"
.c create text 70 4472 -fill #eef -text "371"
.c create line 140 4472 300 4472 -fill #eef -dash {6 4}
.c create line 140 4440 140 4460 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 367 to 371 (Used 1 nobox 1)
# ProcLine[1] stays at 371 (Used 1 nobox 1)
.c create rectangle 66 4462 214 4482 -fill white -width 0
.c create text 140 4472 -text "observe!ORANGE,1"
.c create line 140 4482 220 4482 -fill darkred -tags mesg -width 2
.c create line 220 4482 300 4482 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4496 -fill #eef -text "373"
.c create line 140 4496 300 4496 -fill #eef -dash {6 4}
.c create line 300 4464 300 4484 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 369 to 373 (Used 1 nobox 1)
# ProcLine[2] stays at 373 (Used 1 nobox 1)
.c create rectangle 226 4486 374 4506 -fill white -width 0
.c create text 300 4496 -text "observe?ORANGE,1"
.c create text 70 4520 -fill #eef -text "375"
.c create line 140 4520 300 4520 -fill #eef -dash {6 4}
.c create line 300 4512 300 4508 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 373 to 375 (Used 1 nobox 1)
# ProcLine[2] stays at 375 (Used 1 nobox 1)
.c create rectangle 204 4510 396 4530 -fill white -width 0
.c create text 300 4520 -text "Observateur: ORANGE"
.c create text 70 4544 -fill #eef -text "377"
.c create line 140 4544 300 4544 -fill #eef -dash {6 4}
.c create line 140 4488 140 4532 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 371 to 377 (Used 1 nobox 1)
# ProcLine[1] stays at 377 (Used 1 nobox 1)
.c create rectangle 66 4534 214 4554 -fill white -width 0
.c create text 140 4544 -text "observe!ORANGE,1"
.c create line 140 4554 220 4554 -fill darkred -tags mesg -width 2
.c create line 220 4554 300 4554 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4568 -fill #eef -text "379"
.c create line 140 4568 300 4568 -fill #eef -dash {6 4}
.c create line 300 4536 300 4556 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 375 to 379 (Used 1 nobox 1)
# ProcLine[2] stays at 379 (Used 1 nobox 1)
.c create rectangle 226 4558 374 4578 -fill white -width 0
.c create text 300 4568 -text "observe?ORANGE,1"
.c create text 70 4592 -fill #eef -text "381"
.c create line 140 4592 300 4592 -fill #eef -dash {6 4}
.c create line 140 4560 140 4580 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 377 to 381 (Used 1 nobox 1)
# ProcLine[1] stays at 381 (Used 1 nobox 1)
.c create rectangle 66 4582 214 4602 -fill white -width 0
.c create text 140 4592 -text "observe!ORANGE,1"
.c create line 140 4602 220 4602 -fill darkred -tags mesg -width 2
.c create line 220 4602 300 4602 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4616 -fill #eef -text "383"
.c create line 140 4616 300 4616 -fill #eef -dash {6 4}
.c create line 300 4584 300 4604 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 379 to 383 (Used 1 nobox 1)
# ProcLine[2] stays at 383 (Used 1 nobox 1)
.c create rectangle 226 4606 374 4626 -fill white -width 0
.c create text 300 4616 -text "observe?ORANGE,1"
.c create text 70 4640 -fill #eef -text "385"
.c create line 140 4640 300 4640 -fill #eef -dash {6 4}
.c create line 300 4632 300 4628 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 383 to 385 (Used 1 nobox 1)
# ProcLine[2] stays at 385 (Used 1 nobox 1)
.c create rectangle 204 4630 396 4650 -fill white -width 0
.c create text 300 4640 -text "Observateur: ORANGE"
.c create text 70 4664 -fill #eef -text "387"
.c create line 140 4664 300 4664 -fill #eef -dash {6 4}
.c create line 140 4608 140 4652 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 381 to 387 (Used 1 nobox 1)
# ProcLine[1] stays at 387 (Used 1 nobox 1)
.c create rectangle 66 4654 214 4674 -fill white -width 0
.c create text 140 4664 -text "observe!ORANGE,1"
.c create line 140 4674 220 4674 -fill darkred -tags mesg -width 2
.c create line 220 4674 300 4674 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4688 -fill #eef -text "389"
.c create line 140 4688 300 4688 -fill #eef -dash {6 4}
.c create line 300 4656 300 4676 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 385 to 389 (Used 1 nobox 1)
# ProcLine[2] stays at 389 (Used 1 nobox 1)
.c create rectangle 226 4678 374 4698 -fill white -width 0
.c create text 300 4688 -text "observe?ORANGE,1"
.c create text 70 4712 -fill #eef -text "391"
.c create line 140 4712 300 4712 -fill #eef -dash {6 4}
.c create line 140 4680 140 4700 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 387 to 391 (Used 1 nobox 1)
# ProcLine[1] stays at 391 (Used 1 nobox 1)
.c create rectangle 66 4702 214 4722 -fill white -width 0
.c create text 140 4712 -text "observe!ORANGE,1"
.c create line 140 4722 220 4722 -fill darkred -tags mesg -width 2
.c create line 220 4722 300 4722 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4736 -fill #eef -text "393"
.c create line 140 4736 300 4736 -fill #eef -dash {6 4}
.c create line 300 4704 300 4724 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 389 to 393 (Used 1 nobox 1)
# ProcLine[2] stays at 393 (Used 1 nobox 1)
.c create rectangle 226 4726 374 4746 -fill white -width 0
.c create text 300 4736 -text "observe?ORANGE,1"
.c create text 70 4760 -fill #eef -text "395"
.c create line 140 4760 300 4760 -fill #eef -dash {6 4}
.c create line 300 4752 300 4748 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 393 to 395 (Used 1 nobox 1)
# ProcLine[2] stays at 395 (Used 1 nobox 1)
.c create rectangle 204 4750 396 4770 -fill white -width 0
.c create text 300 4760 -text "Observateur: ORANGE"
.c create text 70 4784 -fill #eef -text "397"
.c create line 140 4784 300 4784 -fill #eef -dash {6 4}
.c create line 140 4728 140 4772 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 391 to 397 (Used 1 nobox 1)
# ProcLine[1] stays at 397 (Used 1 nobox 1)
.c create rectangle 66 4774 214 4794 -fill white -width 0
.c create text 140 4784 -text "observe!ORANGE,1"
.c create line 140 4794 220 4794 -fill darkred -tags mesg -width 2
.c create line 220 4794 300 4794 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4808 -fill #eef -text "399"
.c create line 140 4808 300 4808 -fill #eef -dash {6 4}
.c create line 300 4776 300 4796 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 395 to 399 (Used 1 nobox 1)
# ProcLine[2] stays at 399 (Used 1 nobox 1)
.c create rectangle 226 4798 374 4818 -fill white -width 0
.c create text 300 4808 -text "observe?ORANGE,1"
.c create text 70 4832 -fill #eef -text "401"
.c create line 140 4832 300 4832 -fill #eef -dash {6 4}
.c create line 140 4800 140 4820 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 397 to 401 (Used 1 nobox 1)
# ProcLine[1] stays at 401 (Used 1 nobox 1)
.c create rectangle 66 4822 214 4842 -fill white -width 0
.c create text 140 4832 -text "observe!ORANGE,1"
.c create line 140 4842 220 4842 -fill darkred -tags mesg -width 2
.c create line 220 4842 300 4842 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4856 -fill #eef -text "403"
.c create line 140 4856 300 4856 -fill #eef -dash {6 4}
.c create line 300 4824 300 4844 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 399 to 403 (Used 1 nobox 1)
# ProcLine[2] stays at 403 (Used 1 nobox 1)
.c create rectangle 226 4846 374 4866 -fill white -width 0
.c create text 300 4856 -text "observe?ORANGE,1"
.c create text 70 4880 -fill #eef -text "405"
.c create line 140 4880 300 4880 -fill #eef -dash {6 4}
.c create line 140 4848 140 4868 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 401 to 405 (Used 1 nobox 1)
# ProcLine[1] stays at 405 (Used 1 nobox 1)
.c create rectangle 66 4870 214 4890 -fill white -width 0
.c create text 140 4880 -text "observe!ORANGE,1"
.c create line 140 4890 220 4890 -fill darkred -tags mesg -width 2
.c create line 220 4890 300 4890 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4904 -fill #eef -text "407"
.c create line 140 4904 300 4904 -fill #eef -dash {6 4}
.c create line 300 4872 300 4892 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 403 to 407 (Used 1 nobox 1)
# ProcLine[2] stays at 407 (Used 1 nobox 1)
.c create rectangle 226 4894 374 4914 -fill white -width 0
.c create text 300 4904 -text "observe?ORANGE,1"
.c create text 70 4928 -fill #eef -text "409"
.c create line 140 4928 300 4928 -fill #eef -dash {6 4}
.c create line 140 4896 140 4916 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 405 to 409 (Used 1 nobox 1)
# ProcLine[1] stays at 409 (Used 1 nobox 1)
.c create rectangle 66 4918 214 4938 -fill white -width 0
.c create text 140 4928 -text "observe!ORANGE,1"
.c create line 140 4938 220 4938 -fill darkred -tags mesg -width 2
.c create line 220 4938 300 4938 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 4952 -fill #eef -text "411"
.c create line 140 4952 300 4952 -fill #eef -dash {6 4}
.c create line 300 4920 300 4940 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 407 to 411 (Used 1 nobox 1)
# ProcLine[2] stays at 411 (Used 1 nobox 1)
.c create rectangle 226 4942 374 4962 -fill white -width 0
.c create text 300 4952 -text "observe?ORANGE,1"
.c create text 70 4976 -fill #eef -text "413"
.c create line 140 4976 300 4976 -fill #eef -dash {6 4}
.c create line 140 4944 140 4964 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 409 to 413 (Used 1 nobox 1)
# ProcLine[1] stays at 413 (Used 1 nobox 1)
.c create rectangle 66 4966 214 4986 -fill white -width 0
.c create text 140 4976 -text "observe!ORANGE,1"
.c create line 140 4986 220 4986 -fill darkred -tags mesg -width 2
.c create line 220 4986 300 4986 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5000 -fill #eef -text "415"
.c create line 140 5000 300 5000 -fill #eef -dash {6 4}
.c create line 300 4968 300 4988 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 411 to 415 (Used 1 nobox 1)
# ProcLine[2] stays at 415 (Used 1 nobox 1)
.c create rectangle 226 4990 374 5010 -fill white -width 0
.c create text 300 5000 -text "observe?ORANGE,1"
.c create text 70 5024 -fill #eef -text "417"
.c create line 140 5024 300 5024 -fill #eef -dash {6 4}
.c create line 300 5016 300 5012 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 415 to 417 (Used 1 nobox 1)
# ProcLine[2] stays at 417 (Used 1 nobox 1)
.c create rectangle 204 5014 396 5034 -fill white -width 0
.c create text 300 5024 -text "Observateur: ORANGE"
.c create text 70 5048 -fill #eef -text "419"
.c create line 140 5048 300 5048 -fill #eef -dash {6 4}
.c create line 140 4992 140 5036 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 413 to 419 (Used 1 nobox 1)
# ProcLine[1] stays at 419 (Used 1 nobox 1)
.c create rectangle 66 5038 214 5058 -fill white -width 0
.c create text 140 5048 -text "observe!ORANGE,1"
.c create line 140 5058 220 5058 -fill darkred -tags mesg -width 2
.c create line 220 5058 300 5058 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5072 -fill #eef -text "421"
.c create line 140 5072 300 5072 -fill #eef -dash {6 4}
.c create line 300 5040 300 5060 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 417 to 421 (Used 1 nobox 1)
# ProcLine[2] stays at 421 (Used 1 nobox 1)
.c create rectangle 226 5062 374 5082 -fill white -width 0
.c create text 300 5072 -text "observe?ORANGE,1"
.c create text 70 5096 -fill #eef -text "423"
.c create line 140 5096 300 5096 -fill #eef -dash {6 4}
.c create line 140 5064 140 5084 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 419 to 423 (Used 1 nobox 1)
# ProcLine[1] stays at 423 (Used 1 nobox 1)
.c create rectangle 66 5086 214 5106 -fill white -width 0
.c create text 140 5096 -text "observe!ORANGE,1"
.c create line 140 5106 220 5106 -fill darkred -tags mesg -width 2
.c create line 220 5106 300 5106 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5120 -fill #eef -text "425"
.c create line 140 5120 300 5120 -fill #eef -dash {6 4}
.c create line 300 5088 300 5108 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 421 to 425 (Used 1 nobox 1)
# ProcLine[2] stays at 425 (Used 1 nobox 1)
.c create rectangle 226 5110 374 5130 -fill white -width 0
.c create text 300 5120 -text "observe?ORANGE,1"
.c create text 70 5144 -fill #eef -text "427"
.c create line 140 5144 300 5144 -fill #eef -dash {6 4}
.c create line 140 5112 140 5132 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 423 to 427 (Used 1 nobox 1)
# ProcLine[1] stays at 427 (Used 1 nobox 1)
.c create rectangle 66 5134 214 5154 -fill white -width 0
.c create text 140 5144 -text "observe!ORANGE,1"
.c create line 140 5154 220 5154 -fill darkred -tags mesg -width 2
.c create line 220 5154 300 5154 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5168 -fill #eef -text "429"
.c create line 140 5168 300 5168 -fill #eef -dash {6 4}
.c create line 300 5136 300 5156 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 425 to 429 (Used 1 nobox 1)
# ProcLine[2] stays at 429 (Used 1 nobox 1)
.c create rectangle 226 5158 374 5178 -fill white -width 0
.c create text 300 5168 -text "observe?ORANGE,1"
.c create text 70 5192 -fill #eef -text "431"
.c create line 140 5192 300 5192 -fill #eef -dash {6 4}
.c create line 140 5160 140 5180 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 427 to 431 (Used 1 nobox 1)
# ProcLine[1] stays at 431 (Used 1 nobox 1)
.c create rectangle 66 5182 214 5202 -fill white -width 0
.c create text 140 5192 -text "observe!ORANGE,1"
.c create line 140 5202 220 5202 -fill darkred -tags mesg -width 2
.c create line 220 5202 300 5202 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5216 -fill #eef -text "433"
.c create line 140 5216 300 5216 -fill #eef -dash {6 4}
.c create line 300 5184 300 5204 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 429 to 433 (Used 1 nobox 1)
# ProcLine[2] stays at 433 (Used 1 nobox 1)
.c create rectangle 226 5206 374 5226 -fill white -width 0
.c create text 300 5216 -text "observe?ORANGE,1"
.c create text 70 5240 -fill #eef -text "435"
.c create line 140 5240 300 5240 -fill #eef -dash {6 4}
.c create line 300 5232 300 5228 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 433 to 435 (Used 1 nobox 1)
# ProcLine[2] stays at 435 (Used 1 nobox 1)
.c create rectangle 204 5230 396 5250 -fill white -width 0
.c create text 300 5240 -text "Observateur: ORANGE"
.c create text 70 5264 -fill #eef -text "437"
.c create line 140 5264 300 5264 -fill #eef -dash {6 4}
.c create line 140 5208 140 5252 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 431 to 437 (Used 1 nobox 1)
# ProcLine[1] stays at 437 (Used 1 nobox 1)
.c create rectangle 66 5254 214 5274 -fill white -width 0
.c create text 140 5264 -text "observe!ORANGE,1"
.c create line 140 5274 220 5274 -fill darkred -tags mesg -width 2
.c create line 220 5274 300 5274 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5288 -fill #eef -text "439"
.c create line 140 5288 300 5288 -fill #eef -dash {6 4}
.c create line 300 5256 300 5276 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 435 to 439 (Used 1 nobox 1)
# ProcLine[2] stays at 439 (Used 1 nobox 1)
.c create rectangle 226 5278 374 5298 -fill white -width 0
.c create text 300 5288 -text "observe?ORANGE,1"
.c create text 70 5312 -fill #eef -text "441"
.c create line 140 5312 300 5312 -fill #eef -dash {6 4}
.c create line 140 5280 140 5300 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 437 to 441 (Used 1 nobox 1)
# ProcLine[1] stays at 441 (Used 1 nobox 1)
.c create rectangle 66 5302 214 5322 -fill white -width 0
.c create text 140 5312 -text "observe!ORANGE,1"
.c create line 140 5322 220 5322 -fill darkred -tags mesg -width 2
.c create line 220 5322 300 5322 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5336 -fill #eef -text "443"
.c create line 140 5336 300 5336 -fill #eef -dash {6 4}
.c create line 300 5304 300 5324 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 439 to 443 (Used 1 nobox 1)
# ProcLine[2] stays at 443 (Used 1 nobox 1)
.c create rectangle 226 5326 374 5346 -fill white -width 0
.c create text 300 5336 -text "observe?ORANGE,1"
.c create text 70 5360 -fill #eef -text "445"
.c create line 140 5360 300 5360 -fill #eef -dash {6 4}
.c create line 140 5328 140 5348 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 441 to 445 (Used 1 nobox 1)
# ProcLine[1] stays at 445 (Used 1 nobox 1)
.c create rectangle 66 5350 214 5370 -fill white -width 0
.c create text 140 5360 -text "observe!ORANGE,1"
.c create line 140 5370 220 5370 -fill darkred -tags mesg -width 2
.c create line 220 5370 300 5370 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5384 -fill #eef -text "447"
.c create line 140 5384 300 5384 -fill #eef -dash {6 4}
.c create line 300 5352 300 5372 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 443 to 447 (Used 1 nobox 1)
# ProcLine[2] stays at 447 (Used 1 nobox 1)
.c create rectangle 226 5374 374 5394 -fill white -width 0
.c create text 300 5384 -text "observe?ORANGE,1"
.c create text 70 5408 -fill #eef -text "449"
.c create line 140 5408 300 5408 -fill #eef -dash {6 4}
.c create line 140 5376 140 5396 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 445 to 449 (Used 1 nobox 1)
# ProcLine[1] stays at 449 (Used 1 nobox 1)
.c create rectangle 66 5398 214 5418 -fill white -width 0
.c create text 140 5408 -text "observe!ORANGE,1"
.c create line 140 5418 220 5418 -fill darkred -tags mesg -width 2
.c create line 220 5418 300 5418 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5432 -fill #eef -text "451"
.c create line 140 5432 300 5432 -fill #eef -dash {6 4}
.c create line 300 5400 300 5420 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 447 to 451 (Used 1 nobox 1)
# ProcLine[2] stays at 451 (Used 1 nobox 1)
.c create rectangle 226 5422 374 5442 -fill white -width 0
.c create text 300 5432 -text "observe?ORANGE,1"
.c create text 70 5456 -fill #eef -text "453"
.c create line 140 5456 300 5456 -fill #eef -dash {6 4}
.c create line 140 5424 140 5444 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 449 to 453 (Used 1 nobox 1)
# ProcLine[1] stays at 453 (Used 1 nobox 1)
.c create rectangle 66 5446 214 5466 -fill white -width 0
.c create text 140 5456 -text "observe!ORANGE,1"
.c create line 140 5466 220 5466 -fill darkred -tags mesg -width 2
.c create line 220 5466 300 5466 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5480 -fill #eef -text "455"
.c create line 140 5480 300 5480 -fill #eef -dash {6 4}
.c create line 300 5448 300 5468 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 451 to 455 (Used 1 nobox 1)
# ProcLine[2] stays at 455 (Used 1 nobox 1)
.c create rectangle 226 5470 374 5490 -fill white -width 0
.c create text 300 5480 -text "observe?ORANGE,1"
.c create text 70 5504 -fill #eef -text "457"
.c create line 140 5504 300 5504 -fill #eef -dash {6 4}
.c create line 140 5472 140 5492 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 453 to 457 (Used 1 nobox 1)
# ProcLine[1] stays at 457 (Used 1 nobox 1)
.c create rectangle 66 5494 214 5514 -fill white -width 0
.c create text 140 5504 -text "observe!ORANGE,1"
.c create line 140 5514 220 5514 -fill darkred -tags mesg -width 2
.c create line 220 5514 300 5514 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5528 -fill #eef -text "459"
.c create line 140 5528 300 5528 -fill #eef -dash {6 4}
.c create line 300 5496 300 5516 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 455 to 459 (Used 1 nobox 1)
# ProcLine[2] stays at 459 (Used 1 nobox 1)
.c create rectangle 226 5518 374 5538 -fill white -width 0
.c create text 300 5528 -text "observe?ORANGE,1"
.c create text 70 5552 -fill #eef -text "461"
.c create line 140 5552 300 5552 -fill #eef -dash {6 4}
.c create line 140 5520 140 5540 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 457 to 461 (Used 1 nobox 1)
# ProcLine[1] stays at 461 (Used 1 nobox 1)
.c create rectangle 66 5542 214 5562 -fill white -width 0
.c create text 140 5552 -text "observe!ORANGE,1"
.c create line 140 5562 220 5562 -fill darkred -tags mesg -width 2
.c create line 220 5562 300 5562 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5576 -fill #eef -text "463"
.c create line 140 5576 300 5576 -fill #eef -dash {6 4}
.c create line 300 5544 300 5564 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 459 to 463 (Used 1 nobox 1)
# ProcLine[2] stays at 463 (Used 1 nobox 1)
.c create rectangle 226 5566 374 5586 -fill white -width 0
.c create text 300 5576 -text "observe?ORANGE,1"
.c create text 70 5600 -fill #eef -text "465"
.c create line 140 5600 300 5600 -fill #eef -dash {6 4}
.c create line 140 5568 140 5588 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 461 to 465 (Used 1 nobox 1)
# ProcLine[1] stays at 465 (Used 1 nobox 1)
.c create rectangle 66 5590 214 5610 -fill white -width 0
.c create text 140 5600 -text "observe!ORANGE,1"
.c create line 140 5610 220 5610 -fill darkred -tags mesg -width 2
.c create line 220 5610 300 5610 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5624 -fill #eef -text "467"
.c create line 140 5624 300 5624 -fill #eef -dash {6 4}
.c create line 300 5592 300 5612 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 463 to 467 (Used 1 nobox 1)
# ProcLine[2] stays at 467 (Used 1 nobox 1)
.c create rectangle 226 5614 374 5634 -fill white -width 0
.c create text 300 5624 -text "observe?ORANGE,1"
.c create text 70 5648 -fill #eef -text "469"
.c create line 140 5648 300 5648 -fill #eef -dash {6 4}
.c create line 140 5616 140 5636 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 465 to 469 (Used 1 nobox 1)
# ProcLine[1] stays at 469 (Used 1 nobox 1)
.c create rectangle 66 5638 214 5658 -fill white -width 0
.c create text 140 5648 -text "observe!ORANGE,1"
.c create line 140 5658 220 5658 -fill darkred -tags mesg -width 2
.c create line 220 5658 300 5658 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5672 -fill #eef -text "471"
.c create line 140 5672 300 5672 -fill #eef -dash {6 4}
.c create line 300 5640 300 5660 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 467 to 471 (Used 1 nobox 1)
# ProcLine[2] stays at 471 (Used 1 nobox 1)
.c create rectangle 226 5662 374 5682 -fill white -width 0
.c create text 300 5672 -text "observe?ORANGE,1"
.c create text 70 5696 -fill #eef -text "473"
.c create line 140 5696 300 5696 -fill #eef -dash {6 4}
.c create line 300 5688 300 5684 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 471 to 473 (Used 1 nobox 1)
# ProcLine[2] stays at 473 (Used 1 nobox 1)
.c create rectangle 204 5686 396 5706 -fill white -width 0
.c create text 300 5696 -text "Observateur: ORANGE"
.c create text 70 5720 -fill #eef -text "475"
.c create line 140 5720 300 5720 -fill #eef -dash {6 4}
.c create line 140 5664 140 5708 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 469 to 475 (Used 1 nobox 1)
# ProcLine[1] stays at 475 (Used 1 nobox 1)
.c create rectangle 66 5710 214 5730 -fill white -width 0
.c create text 140 5720 -text "observe!ORANGE,1"
.c create line 140 5730 220 5730 -fill darkred -tags mesg -width 2
.c create line 220 5730 300 5730 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5744 -fill #eef -text "477"
.c create line 140 5744 300 5744 -fill #eef -dash {6 4}
.c create line 300 5712 300 5732 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 473 to 477 (Used 1 nobox 1)
# ProcLine[2] stays at 477 (Used 1 nobox 1)
.c create rectangle 226 5734 374 5754 -fill white -width 0
.c create text 300 5744 -text "observe?ORANGE,1"
.c create text 70 5768 -fill #eef -text "479"
.c create line 140 5768 300 5768 -fill #eef -dash {6 4}
.c create line 140 5736 140 5756 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 475 to 479 (Used 1 nobox 1)
# ProcLine[1] stays at 479 (Used 1 nobox 1)
.c create rectangle 66 5758 214 5778 -fill white -width 0
.c create text 140 5768 -text "observe!ORANGE,1"
.c create line 140 5778 220 5778 -fill darkred -tags mesg -width 2
.c create line 220 5778 300 5778 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5792 -fill #eef -text "481"
.c create line 140 5792 300 5792 -fill #eef -dash {6 4}
.c create line 300 5760 300 5780 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 477 to 481 (Used 1 nobox 1)
# ProcLine[2] stays at 481 (Used 1 nobox 1)
.c create rectangle 226 5782 374 5802 -fill white -width 0
.c create text 300 5792 -text "observe?ORANGE,1"
.c create text 70 5816 -fill #eef -text "483"
.c create line 140 5816 300 5816 -fill #eef -dash {6 4}
.c create line 300 5808 300 5804 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 481 to 483 (Used 1 nobox 1)
# ProcLine[2] stays at 483 (Used 1 nobox 1)
.c create rectangle 204 5806 396 5826 -fill white -width 0
.c create text 300 5816 -text "Observateur: ORANGE"
.c create text 70 5840 -fill #eef -text "485"
.c create line 140 5840 300 5840 -fill #eef -dash {6 4}
.c create line 140 5784 140 5828 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 479 to 485 (Used 1 nobox 1)
# ProcLine[1] stays at 485 (Used 1 nobox 1)
.c create rectangle 66 5830 214 5850 -fill white -width 0
.c create text 140 5840 -text "observe!ORANGE,1"
.c create line 140 5850 220 5850 -fill darkred -tags mesg -width 2
.c create line 220 5850 300 5850 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5864 -fill #eef -text "487"
.c create line 140 5864 300 5864 -fill #eef -dash {6 4}
.c create line 300 5832 300 5852 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 483 to 487 (Used 1 nobox 1)
# ProcLine[2] stays at 487 (Used 1 nobox 1)
.c create rectangle 226 5854 374 5874 -fill white -width 0
.c create text 300 5864 -text "observe?ORANGE,1"
.c create text 70 5888 -fill #eef -text "489"
.c create line 140 5888 300 5888 -fill #eef -dash {6 4}
.c create line 140 5856 140 5876 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 485 to 489 (Used 1 nobox 1)
# ProcLine[1] stays at 489 (Used 1 nobox 1)
.c create rectangle 66 5878 214 5898 -fill white -width 0
.c create text 140 5888 -text "observe!ORANGE,1"
.c create line 140 5898 220 5898 -fill darkred -tags mesg -width 2
.c create line 220 5898 300 5898 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5912 -fill #eef -text "491"
.c create line 140 5912 300 5912 -fill #eef -dash {6 4}
.c create line 300 5880 300 5900 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 487 to 491 (Used 1 nobox 1)
# ProcLine[2] stays at 491 (Used 1 nobox 1)
.c create rectangle 226 5902 374 5922 -fill white -width 0
.c create text 300 5912 -text "observe?ORANGE,1"
.c create text 70 5936 -fill #eef -text "493"
.c create line 140 5936 300 5936 -fill #eef -dash {6 4}
.c create line 140 5904 140 5924 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 489 to 493 (Used 1 nobox 1)
# ProcLine[1] stays at 493 (Used 1 nobox 1)
.c create rectangle 66 5926 214 5946 -fill white -width 0
.c create text 140 5936 -text "observe!ORANGE,1"
.c create line 140 5946 220 5946 -fill darkred -tags mesg -width 2
.c create line 220 5946 300 5946 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 5960 -fill #eef -text "495"
.c create line 140 5960 300 5960 -fill #eef -dash {6 4}
.c create line 300 5928 300 5948 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 491 to 495 (Used 1 nobox 1)
# ProcLine[2] stays at 495 (Used 1 nobox 1)
.c create rectangle 226 5950 374 5970 -fill white -width 0
.c create text 300 5960 -text "observe?ORANGE,1"
.c create text 70 5984 -fill #eef -text "497"
.c create line 140 5984 300 5984 -fill #eef -dash {6 4}
.c create line 140 5952 140 5972 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 493 to 497 (Used 1 nobox 1)
# ProcLine[1] stays at 497 (Used 1 nobox 1)
.c create rectangle 66 5974 214 5994 -fill white -width 0
.c create text 140 5984 -text "observe!ORANGE,1"
.c create line 140 5994 220 5994 -fill darkred -tags mesg -width 2
.c create line 220 5994 300 5994 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 6008 -fill #eef -text "499"
.c create line 140 6008 300 6008 -fill #eef -dash {6 4}
.c create line 300 5976 300 5996 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 495 to 499 (Used 1 nobox 1)
# ProcLine[2] stays at 499 (Used 1 nobox 1)
.c create rectangle 226 5998 374 6018 -fill white -width 0
.c create text 300 6008 -text "observe?ORANGE,1"
.c create text 70 6032 -fill #eef -text "501"
.c create line 140 6032 300 6032 -fill #eef -dash {6 4}
.c create line 300 6024 300 6020 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 499 to 501 (Used 1 nobox 1)
# ProcLine[2] stays at 501 (Used 1 nobox 1)
.c create rectangle 204 6022 396 6042 -fill white -width 0
.c create text 300 6032 -text "Observateur: ORANGE"
.c create text 70 6056 -fill #eef -text "503"
.c create line 140 6056 300 6056 -fill #eef -dash {6 4}
.c create line 140 6000 140 6044 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 497 to 503 (Used 1 nobox 1)
# ProcLine[1] stays at 503 (Used 1 nobox 1)
.c create rectangle 66 6046 214 6066 -fill white -width 0
.c create text 140 6056 -text "observe!ORANGE,1"
.c create line 140 6066 220 6066 -fill darkred -tags mesg -width 2
.c create line 220 6066 300 6066 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 6080 -fill #eef -text "505"
.c create line 140 6080 300 6080 -fill #eef -dash {6 4}
.c create line 300 6048 300 6068 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 501 to 505 (Used 1 nobox 1)
# ProcLine[2] stays at 505 (Used 1 nobox 1)
.c create rectangle 226 6070 374 6090 -fill white -width 0
.c create text 300 6080 -text "observe?ORANGE,1"
.c create text 70 6104 -fill #eef -text "507"
.c create line 140 6104 300 6104 -fill #eef -dash {6 4}
.c create line 140 6072 140 6092 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 503 to 507 (Used 1 nobox 1)
# ProcLine[1] stays at 507 (Used 1 nobox 1)
.c create rectangle 66 6094 214 6114 -fill white -width 0
.c create text 140 6104 -text "observe!ORANGE,1"
.c create line 140 6114 220 6114 -fill darkred -tags mesg -width 2
.c create line 220 6114 300 6114 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 6128 -fill #eef -text "509"
.c create line 140 6128 300 6128 -fill #eef -dash {6 4}
.c create line 300 6096 300 6116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 505 to 509 (Used 1 nobox 1)
# ProcLine[2] stays at 509 (Used 1 nobox 1)
.c create rectangle 226 6118 374 6138 -fill white -width 0
.c create text 300 6128 -text "observe?ORANGE,1"
.c create text 70 6152 -fill #eef -text "511"
.c create line 140 6152 300 6152 -fill #eef -dash {6 4}
.c create line 140 6120 140 6140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 507 to 511 (Used 1 nobox 1)
# ProcLine[1] stays at 511 (Used 1 nobox 1)
.c create rectangle 66 6142 214 6162 -fill white -width 0
.c create text 140 6152 -text "observe!ORANGE,1"
.c create line 140 6162 220 6162 -fill darkred -tags mesg -width 2
.c create line 220 6162 300 6162 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 6176 -fill #eef -text "513"
.c create line 140 6176 300 6176 -fill #eef -dash {6 4}
.c create line 300 6144 300 6164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 509 to 513 (Used 1 nobox 1)
# ProcLine[2] stays at 513 (Used 1 nobox 1)
.c create rectangle 226 6166 374 6186 -fill white -width 0
.c create text 300 6176 -text "observe?ORANGE,1"
.c create text 70 6200 -fill #eef -text "515"
.c create line 140 6200 300 6200 -fill #eef -dash {6 4}
.c create line 300 6192 300 6188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 513 to 515 (Used 1 nobox 1)
# ProcLine[2] stays at 515 (Used 1 nobox 1)
.c create rectangle 204 6190 396 6210 -fill white -width 0
.c create text 300 6200 -text "Observateur: ORANGE"
.c create text 70 6224 -fill #eef -text "517"
.c create line 140 6224 300 6224 -fill #eef -dash {6 4}
.c create line 140 6168 140 6212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 511 to 517 (Used 1 nobox 1)
# ProcLine[1] stays at 517 (Used 1 nobox 1)
.c create rectangle 66 6214 214 6234 -fill white -width 0
.c create text 140 6224 -text "observe!ORANGE,1"
.c create line 140 6234 220 6234 -fill darkred -tags mesg -width 2
.c create line 220 6234 300 6234 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 6248 -fill #eef -text "519"
.c create line 140 6248 300 6248 -fill #eef -dash {6 4}
.c create line 300 6216 300 6236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 515 to 519 (Used 1 nobox 1)
# ProcLine[2] stays at 519 (Used 1 nobox 1)
.c create rectangle 226 6238 374 6258 -fill white -width 0
.c create text 300 6248 -text "observe?ORANGE,1"
.c create text 70 6272 -fill #eef -text "521"
.c create line 140 6272 300 6272 -fill #eef -dash {6 4}
.c create line 300 6264 300 6260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 519 to 521 (Used 1 nobox 1)
# ProcLine[2] stays at 521 (Used 1 nobox 1)
.c create rectangle 204 6262 396 6282 -fill white -width 0
.c create text 300 6272 -text "Observateur: ORANGE"
.c create text 70 6296 -fill #eef -text "523"
.c create line 140 6296 300 6296 -fill #eef -dash {6 4}
.c create line 140 6240 140 6284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 517 to 523 (Used 1 nobox 1)
# ProcLine[1] stays at 523 (Used 1 nobox 1)
.c create rectangle 66 6286 214 6306 -fill white -width 0
.c create text 140 6296 -text "observe!ORANGE,1"
.c create line 140 6306 220 6306 -fill darkred -tags mesg -width 2
.c create line 220 6306 300 6306 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 6320 -fill #eef -text "525"
.c create line 140 6320 300 6320 -fill #eef -dash {6 4}
.c create line 300 6288 300 6308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 521 to 525 (Used 1 nobox 1)
# ProcLine[2] stays at 525 (Used 1 nobox 1)
.c create rectangle 226 6310 374 6330 -fill white -width 0
.c create text 300 6320 -text "observe?ORANGE,1"
.c create text 70 6344 -fill #eef -text "527"
.c create line 140 6344 300 6344 -fill #eef -dash {6 4}
.c create line 140 6312 140 6332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 523 to 527 (Used 1 nobox 1)
# ProcLine[1] stays at 527 (Used 1 nobox 1)
.c create rectangle 66 6334 214 6354 -fill white -width 0
.c create text 140 6344 -text "observe!ORANGE,1"
.c create line 140 6354 220 6354 -fill darkred -tags mesg -width 2
.c create line 220 6354 300 6354 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 6368 -fill #eef -text "529"
.c create line 140 6368 300 6368 -fill #eef -dash {6 4}
.c create line 300 6336 300 6356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 525 to 529 (Used 1 nobox 1)
# ProcLine[2] stays at 529 (Used 1 nobox 1)
.c create rectangle 226 6358 374 6378 -fill white -width 0
.c create text 300 6368 -text "observe?ORANGE,1"
.c lower grid
.c raise mesg
