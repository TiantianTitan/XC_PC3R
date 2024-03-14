wm title . "scenario"
wm geometry . 320x600+650+100
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
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 86 0 198 20 -fill black
# ProcLine[1] stays at 0 (Used 0 nobox 0)
.c create rectangle 84 -2 196 18 -fill ivory
.c create text 140 8 -text "0:labyrinthe"
.c create text 70 32 -fill #eef -text "1"
.c create line 140 32 140 32 -fill #eef -dash {6 4}
.c create line 140 36 140 20 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 0 to 1 (Used 1 nobox 0)
# ProcLine[1] stays at 1 (Used 1 nobox 1)
.c create rectangle 31 22 249 42 -fill white -width 0
.c create text 140 32 -text "Début à la case 0_4. "
.c create text 70 56 -fill #eef -text "3"
.c create line 140 56 140 56 -fill #eef -dash {6 4}
.c create line 140 48 140 44 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 1 to 3 (Used 1 nobox 1)
# ProcLine[1] stays at 3 (Used 1 nobox 1)
.c create rectangle 31 46 249 66 -fill white -width 0
.c create text 140 56 -text "Haut vers la case 1_4. "
.c create text 70 80 -fill #eef -text "5"
.c create line 140 80 140 80 -fill #eef -dash {6 4}
.c create line 140 72 140 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 3 to 5 (Used 1 nobox 1)
# ProcLine[1] stays at 5 (Used 1 nobox 1)
.c create rectangle 20 70 260 90 -fill white -width 0
.c create text 140 80 -text "Gauche vers la case 1_3. "
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 140 104 -fill #eef -dash {6 4}
.c create line 140 96 140 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 5 to 7 (Used 1 nobox 1)
# ProcLine[1] stays at 7 (Used 1 nobox 1)
.c create rectangle 20 94 260 114 -fill white -width 0
.c create text 140 104 -text "Droite vers la case 1_4. "
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 140 128 -fill #eef -dash {6 4}
.c create line 140 120 140 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 7 to 9 (Used 1 nobox 1)
# ProcLine[1] stays at 9 (Used 1 nobox 1)
.c create rectangle 36 118 244 138 -fill white -width 0
.c create text 140 128 -text "Bas vers la case 0_4. "
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 140 152 -fill #eef -dash {6 4}
.c create line 140 144 140 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 9 to 11 (Used 1 nobox 1)
# ProcLine[1] stays at 11 (Used 1 nobox 1)
.c create rectangle 31 142 249 162 -fill white -width 0
.c create text 140 152 -text "Haut vers la case 1_4. "
.c create text 70 176 -fill #eef -text "13"
.c create line 140 176 140 176 -fill #eef -dash {6 4}
.c create line 140 168 140 164 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 11 to 13 (Used 1 nobox 1)
# ProcLine[1] stays at 13 (Used 1 nobox 1)
.c create rectangle 31 166 249 186 -fill white -width 0
.c create text 140 176 -text "Haut vers la case 2_4. "
.c create text 70 200 -fill #eef -text "15"
.c create line 140 200 140 200 -fill #eef -dash {6 4}
.c create line 140 192 140 188 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 13 to 15 (Used 1 nobox 1)
# ProcLine[1] stays at 15 (Used 1 nobox 1)
.c create rectangle 31 190 249 210 -fill white -width 0
.c create text 140 200 -text "Haut vers la case 3_4. "
.c create text 70 224 -fill #eef -text "17"
.c create line 140 224 140 224 -fill #eef -dash {6 4}
.c create line 140 216 140 212 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 15 to 17 (Used 1 nobox 1)
# ProcLine[1] stays at 17 (Used 1 nobox 1)
.c create rectangle 31 214 249 234 -fill white -width 0
.c create text 140 224 -text "Haut vers la case 4_4. "
.c create text 70 248 -fill #eef -text "19"
.c create line 140 248 140 248 -fill #eef -dash {6 4}
.c create line 140 240 140 236 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 17 to 19 (Used 1 nobox 1)
# ProcLine[1] stays at 19 (Used 1 nobox 1)
.c create rectangle 36 238 244 258 -fill white -width 0
.c create text 140 248 -text "Bas vers la case 3_4. "
.c create text 70 272 -fill #eef -text "21"
.c create line 140 272 140 272 -fill #eef -dash {6 4}
.c create line 140 264 140 260 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 19 to 21 (Used 1 nobox 1)
# ProcLine[1] stays at 21 (Used 1 nobox 1)
.c create rectangle 31 262 249 282 -fill white -width 0
.c create text 140 272 -text "Haut vers la case 4_4. "
.c create text 70 296 -fill #eef -text "23"
.c create line 140 296 140 296 -fill #eef -dash {6 4}
.c create line 140 288 140 284 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 21 to 23 (Used 1 nobox 1)
# ProcLine[1] stays at 23 (Used 1 nobox 1)
.c create rectangle 36 286 244 306 -fill white -width 0
.c create text 140 296 -text "Bas vers la case 3_4. "
.c create text 70 320 -fill #eef -text "25"
.c create line 140 320 140 320 -fill #eef -dash {6 4}
.c create line 140 312 140 308 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 23 to 25 (Used 1 nobox 1)
# ProcLine[1] stays at 25 (Used 1 nobox 1)
.c create rectangle 36 310 244 330 -fill white -width 0
.c create text 140 320 -text "Bas vers la case 2_4. "
.c create text 70 344 -fill #eef -text "27"
.c create line 140 344 140 344 -fill #eef -dash {6 4}
.c create line 140 336 140 332 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 25 to 27 (Used 1 nobox 1)
# ProcLine[1] stays at 27 (Used 1 nobox 1)
.c create rectangle 36 334 244 354 -fill white -width 0
.c create text 140 344 -text "Bas vers la case 1_4. "
.c create text 70 368 -fill #eef -text "29"
.c create line 140 368 140 368 -fill #eef -dash {6 4}
.c create line 140 360 140 356 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 27 to 29 (Used 1 nobox 1)
# ProcLine[1] stays at 29 (Used 1 nobox 1)
.c create rectangle 31 358 249 378 -fill white -width 0
.c create text 140 368 -text "Haut vers la case 2_4. "
.c create text 70 392 -fill #eef -text "31"
.c create line 140 392 140 392 -fill #eef -dash {6 4}
.c create line 140 384 140 380 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 29 to 31 (Used 1 nobox 1)
# ProcLine[1] stays at 31 (Used 1 nobox 1)
.c create rectangle 31 382 249 402 -fill white -width 0
.c create text 140 392 -text "Haut vers la case 3_4. "
.c create text 70 416 -fill #eef -text "33"
.c create line 140 416 140 416 -fill #eef -dash {6 4}
.c create line 140 408 140 404 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 31 to 33 (Used 1 nobox 1)
# ProcLine[1] stays at 33 (Used 1 nobox 1)
.c create rectangle 36 406 244 426 -fill white -width 0
.c create text 140 416 -text "Bas vers la case 2_4. "
.c create text 70 440 -fill #eef -text "35"
.c create line 140 440 140 440 -fill #eef -dash {6 4}
.c create line 140 432 140 428 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 33 to 35 (Used 1 nobox 1)
# ProcLine[1] stays at 35 (Used 1 nobox 1)
.c create rectangle 31 430 249 450 -fill white -width 0
.c create text 140 440 -text "Haut vers la case 3_4. "
.c create text 70 464 -fill #eef -text "37"
.c create line 140 464 140 464 -fill #eef -dash {6 4}
.c create line 140 456 140 452 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 35 to 37 (Used 1 nobox 1)
# ProcLine[1] stays at 37 (Used 1 nobox 1)
.c create rectangle 31 454 249 474 -fill white -width 0
.c create text 140 464 -text "Haut vers la case 4_4. "
.c create text 70 488 -fill #eef -text "39"
.c create line 140 488 140 488 -fill #eef -dash {6 4}
.c create line 140 480 140 476 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 37 to 39 (Used 1 nobox 1)
# ProcLine[1] stays at 39 (Used 1 nobox 1)
.c create rectangle 36 478 244 498 -fill white -width 0
.c create text 140 488 -text "Bas vers la case 3_4. "
.c create text 70 512 -fill #eef -text "41"
.c create line 140 512 140 512 -fill #eef -dash {6 4}
.c create line 140 504 140 500 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 39 to 41 (Used 1 nobox 1)
# ProcLine[1] stays at 41 (Used 1 nobox 1)
.c create rectangle 31 502 249 522 -fill white -width 0
.c create text 140 512 -text "Haut vers la case 4_4. "
.c create text 70 536 -fill #eef -text "43"
.c create line 140 536 140 536 -fill #eef -dash {6 4}
.c create line 140 528 140 524 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 41 to 43 (Used 1 nobox 1)
# ProcLine[1] stays at 43 (Used 1 nobox 1)
.c create rectangle 36 526 244 546 -fill white -width 0
.c create text 140 536 -text "Bas vers la case 3_4. "
.c create text 70 560 -fill #eef -text "45"
.c create line 140 560 140 560 -fill #eef -dash {6 4}
.c create line 140 552 140 548 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 43 to 45 (Used 1 nobox 1)
# ProcLine[1] stays at 45 (Used 1 nobox 1)
.c create rectangle 36 550 244 570 -fill white -width 0
.c create text 140 560 -text "Bas vers la case 2_4. "
.c create text 70 584 -fill #eef -text "47"
.c create line 140 584 140 584 -fill #eef -dash {6 4}
.c create line 140 576 140 572 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 45 to 47 (Used 1 nobox 1)
# ProcLine[1] stays at 47 (Used 1 nobox 1)
.c create rectangle 31 574 249 594 -fill white -width 0
.c create text 140 584 -text "Haut vers la case 3_4. "
.c create text 70 608 -fill #eef -text "49"
.c create line 140 608 140 608 -fill #eef -dash {6 4}
.c create line 140 600 140 596 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 47 to 49 (Used 1 nobox 1)
# ProcLine[1] stays at 49 (Used 1 nobox 1)
.c create rectangle 36 598 244 618 -fill white -width 0
.c create text 140 608 -text "Bas vers la case 2_4. "
.c create text 70 632 -fill #eef -text "51"
.c create line 140 632 140 632 -fill #eef -dash {6 4}
.c create line 140 624 140 620 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 49 to 51 (Used 1 nobox 1)
# ProcLine[1] stays at 51 (Used 1 nobox 1)
.c create rectangle 31 622 249 642 -fill white -width 0
.c create text 140 632 -text "Haut vers la case 3_4. "
.c create text 70 656 -fill #eef -text "53"
.c create line 140 656 140 656 -fill #eef -dash {6 4}
.c create line 140 648 140 644 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 51 to 53 (Used 1 nobox 1)
# ProcLine[1] stays at 53 (Used 1 nobox 1)
.c create rectangle 36 646 244 666 -fill white -width 0
.c create text 140 656 -text "Bas vers la case 2_4. "
.c create text 70 680 -fill #eef -text "55"
.c create line 140 680 140 680 -fill #eef -dash {6 4}
.c create line 140 672 140 668 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 53 to 55 (Used 1 nobox 1)
# ProcLine[1] stays at 55 (Used 1 nobox 1)
.c create rectangle 36 670 244 690 -fill white -width 0
.c create text 140 680 -text "Bas vers la case 1_4. "
.c create text 70 704 -fill #eef -text "57"
.c create line 140 704 140 704 -fill #eef -dash {6 4}
.c create line 140 696 140 692 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 55 to 57 (Used 1 nobox 1)
# ProcLine[1] stays at 57 (Used 1 nobox 1)
.c create rectangle 20 694 260 714 -fill white -width 0
.c create text 140 704 -text "Gauche vers la case 1_3. "
.c create text 70 728 -fill #eef -text "59"
.c create line 140 728 140 728 -fill #eef -dash {6 4}
.c create line 140 720 140 716 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 57 to 59 (Used 1 nobox 1)
# ProcLine[1] stays at 59 (Used 1 nobox 1)
.c create rectangle 20 718 260 738 -fill white -width 0
.c create text 140 728 -text "Droite vers la case 1_4. "
.c create text 70 752 -fill #eef -text "61"
.c create line 140 752 140 752 -fill #eef -dash {6 4}
.c create line 140 744 140 740 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 59 to 61 (Used 1 nobox 1)
# ProcLine[1] stays at 61 (Used 1 nobox 1)
.c create rectangle 36 742 244 762 -fill white -width 0
.c create text 140 752 -text "Bas vers la case 0_4. "
.c create text 70 776 -fill #eef -text "63"
.c create line 140 776 140 776 -fill #eef -dash {6 4}
.c create line 140 768 140 764 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 61 to 63 (Used 1 nobox 1)
# ProcLine[1] stays at 63 (Used 1 nobox 1)
.c create rectangle 31 766 249 786 -fill white -width 0
.c create text 140 776 -text "Haut vers la case 1_4. "
.c create text 70 800 -fill #eef -text "65"
.c create line 140 800 140 800 -fill #eef -dash {6 4}
.c create line 140 792 140 788 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 63 to 65 (Used 1 nobox 1)
# ProcLine[1] stays at 65 (Used 1 nobox 1)
.c create rectangle 20 790 260 810 -fill white -width 0
.c create text 140 800 -text "Gauche vers la case 1_3. "
.c create text 70 824 -fill #eef -text "67"
.c create line 140 824 140 824 -fill #eef -dash {6 4}
.c create line 140 816 140 812 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 65 to 67 (Used 1 nobox 1)
# ProcLine[1] stays at 67 (Used 1 nobox 1)
.c create rectangle 20 814 260 834 -fill white -width 0
.c create text 140 824 -text "Droite vers la case 1_4. "
.c create text 70 848 -fill #eef -text "69"
.c create line 140 848 140 848 -fill #eef -dash {6 4}
.c create line 140 840 140 836 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 67 to 69 (Used 1 nobox 1)
# ProcLine[1] stays at 69 (Used 1 nobox 1)
.c create rectangle 36 838 244 858 -fill white -width 0
.c create text 140 848 -text "Bas vers la case 0_4. "
.c create text 70 872 -fill #eef -text "71"
.c create line 140 872 140 872 -fill #eef -dash {6 4}
.c create line 140 864 140 860 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 69 to 71 (Used 1 nobox 1)
# ProcLine[1] stays at 71 (Used 1 nobox 1)
.c create rectangle 31 862 249 882 -fill white -width 0
.c create text 140 872 -text "Haut vers la case 1_4. "
.c create text 70 896 -fill #eef -text "73"
.c create line 140 896 140 896 -fill #eef -dash {6 4}
.c create line 140 888 140 884 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 71 to 73 (Used 1 nobox 1)
# ProcLine[1] stays at 73 (Used 1 nobox 1)
.c create rectangle 31 886 249 906 -fill white -width 0
.c create text 140 896 -text "Haut vers la case 2_4. "
.c create text 70 920 -fill #eef -text "75"
.c create line 140 920 140 920 -fill #eef -dash {6 4}
.c create line 140 912 140 908 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 73 to 75 (Used 1 nobox 1)
# ProcLine[1] stays at 75 (Used 1 nobox 1)
.c create rectangle 36 910 244 930 -fill white -width 0
.c create text 140 920 -text "Bas vers la case 1_4. "
.c create text 70 944 -fill #eef -text "77"
.c create line 140 944 140 944 -fill #eef -dash {6 4}
.c create line 140 936 140 932 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 75 to 77 (Used 1 nobox 1)
# ProcLine[1] stays at 77 (Used 1 nobox 1)
.c create rectangle 36 934 244 954 -fill white -width 0
.c create text 140 944 -text "Bas vers la case 0_4. "
.c create text 70 968 -fill #eef -text "79"
.c create line 140 968 140 968 -fill #eef -dash {6 4}
.c create line 140 960 140 956 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 77 to 79 (Used 1 nobox 1)
# ProcLine[1] stays at 79 (Used 1 nobox 1)
.c create rectangle 31 958 249 978 -fill white -width 0
.c create text 140 968 -text "Haut vers la case 1_4. "
.c create text 70 992 -fill #eef -text "81"
.c create line 140 992 140 992 -fill #eef -dash {6 4}
.c create line 140 984 140 980 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 79 to 81 (Used 1 nobox 1)
# ProcLine[1] stays at 81 (Used 1 nobox 1)
.c create rectangle 36 982 244 1002 -fill white -width 0
.c create text 140 992 -text "Bas vers la case 0_4. "
.c create text 70 1016 -fill #eef -text "83"
.c create line 140 1016 140 1016 -fill #eef -dash {6 4}
.c create line 140 1008 140 1004 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 81 to 83 (Used 1 nobox 1)
# ProcLine[1] stays at 83 (Used 1 nobox 1)
.c create rectangle 31 1006 249 1026 -fill white -width 0
.c create text 140 1016 -text "Haut vers la case 1_4. "
.c create text 70 1040 -fill #eef -text "85"
.c create line 140 1040 140 1040 -fill #eef -dash {6 4}
.c create line 140 1032 140 1028 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 83 to 85 (Used 1 nobox 1)
# ProcLine[1] stays at 85 (Used 1 nobox 1)
.c create rectangle 36 1030 244 1050 -fill white -width 0
.c create text 140 1040 -text "Bas vers la case 0_4. "
.c create text 70 1064 -fill #eef -text "87"
.c create line 140 1064 140 1064 -fill #eef -dash {6 4}
.c create line 140 1056 140 1052 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 85 to 87 (Used 1 nobox 1)
# ProcLine[1] stays at 87 (Used 1 nobox 1)
.c create rectangle 31 1054 249 1074 -fill white -width 0
.c create text 140 1064 -text "Haut vers la case 1_4. "
.c create text 70 1088 -fill #eef -text "89"
.c create line 140 1088 140 1088 -fill #eef -dash {6 4}
.c create line 140 1080 140 1076 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 87 to 89 (Used 1 nobox 1)
# ProcLine[1] stays at 89 (Used 1 nobox 1)
.c create rectangle 20 1078 260 1098 -fill white -width 0
.c create text 140 1088 -text "Gauche vers la case 1_3. "
.c create text 70 1112 -fill #eef -text "91"
.c create line 140 1112 140 1112 -fill #eef -dash {6 4}
.c create line 140 1104 140 1100 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 89 to 91 (Used 1 nobox 1)
# ProcLine[1] stays at 91 (Used 1 nobox 1)
.c create rectangle 20 1102 260 1122 -fill white -width 0
.c create text 140 1112 -text "Droite vers la case 1_4. "
.c create text 70 1136 -fill #eef -text "93"
.c create line 140 1136 140 1136 -fill #eef -dash {6 4}
.c create line 140 1128 140 1124 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 91 to 93 (Used 1 nobox 1)
# ProcLine[1] stays at 93 (Used 1 nobox 1)
.c create rectangle 36 1126 244 1146 -fill white -width 0
.c create text 140 1136 -text "Bas vers la case 0_4. "
.c create text 70 1160 -fill #eef -text "95"
.c create line 140 1160 140 1160 -fill #eef -dash {6 4}
.c create line 140 1152 140 1148 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 93 to 95 (Used 1 nobox 1)
# ProcLine[1] stays at 95 (Used 1 nobox 1)
.c create rectangle 31 1150 249 1170 -fill white -width 0
.c create text 140 1160 -text "Haut vers la case 1_4. "
.c create text 70 1184 -fill #eef -text "97"
.c create line 140 1184 140 1184 -fill #eef -dash {6 4}
.c create line 140 1176 140 1172 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 95 to 97 (Used 1 nobox 1)
# ProcLine[1] stays at 97 (Used 1 nobox 1)
.c create rectangle 20 1174 260 1194 -fill white -width 0
.c create text 140 1184 -text "Gauche vers la case 1_3. "
.c create text 70 1208 -fill #eef -text "99"
.c create line 140 1208 140 1208 -fill #eef -dash {6 4}
.c create line 140 1200 140 1196 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 97 to 99 (Used 1 nobox 1)
# ProcLine[1] stays at 99 (Used 1 nobox 1)
.c create rectangle 20 1198 260 1218 -fill white -width 0
.c create text 140 1208 -text "Gauche vers la case 1_2. "
.c create text 70 1232 -fill #eef -text "101"
.c create line 140 1232 140 1232 -fill #eef -dash {6 4}
.c create line 140 1224 140 1220 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 99 to 101 (Used 1 nobox 1)
# ProcLine[1] stays at 101 (Used 1 nobox 1)
.c create rectangle 20 1222 260 1242 -fill white -width 0
.c create text 140 1232 -text "Gauche vers la case 1_1. "
.c create text 70 1256 -fill #eef -text "103"
.c create line 140 1256 140 1256 -fill #eef -dash {6 4}
.c create line 140 1248 140 1244 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 101 to 103 (Used 1 nobox 1)
# ProcLine[1] stays at 103 (Used 1 nobox 1)
.c create rectangle 31 1246 249 1266 -fill white -width 0
.c create text 140 1256 -text "Haut vers la case 2_1. "
.c create text 70 1280 -fill #eef -text "105"
.c create line 140 1280 140 1280 -fill #eef -dash {6 4}
.c create line 140 1272 140 1268 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 103 to 105 (Used 1 nobox 1)
# ProcLine[1] stays at 105 (Used 1 nobox 1)
.c create rectangle 36 1270 244 1290 -fill white -width 0
.c create text 140 1280 -text "Bas vers la case 1_1. "
.c create text 70 1304 -fill #eef -text "107"
.c create line 140 1304 140 1304 -fill #eef -dash {6 4}
.c create line 140 1296 140 1292 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 105 to 107 (Used 1 nobox 1)
# ProcLine[1] stays at 107 (Used 1 nobox 1)
.c create rectangle 36 1294 244 1314 -fill white -width 0
.c create text 140 1304 -text "Bas vers la case 0_1. "
.c create text 70 1328 -fill #eef -text "109"
.c create line 140 1328 140 1328 -fill #eef -dash {6 4}
.c create line 140 1320 140 1316 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 107 to 109 (Used 1 nobox 1)
# ProcLine[1] stays at 109 (Used 1 nobox 1)
.c create rectangle 31 1318 249 1338 -fill white -width 0
.c create text 140 1328 -text "Haut vers la case 1_1. "
.c create text 70 1352 -fill #eef -text "111"
.c create line 140 1352 140 1352 -fill #eef -dash {6 4}
.c create line 140 1344 140 1340 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 109 to 111 (Used 1 nobox 1)
# ProcLine[1] stays at 111 (Used 1 nobox 1)
.c create rectangle 36 1342 244 1362 -fill white -width 0
.c create text 140 1352 -text "Bas vers la case 0_1. "
.c create text 70 1376 -fill #eef -text "113"
.c create line 140 1376 140 1376 -fill #eef -dash {6 4}
.c create line 140 1368 140 1364 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 111 to 113 (Used 1 nobox 1)
# ProcLine[1] stays at 113 (Used 1 nobox 1)
.c create rectangle 31 1366 249 1386 -fill white -width 0
.c create text 140 1376 -text "Haut vers la case 1_1. "
.c create text 70 1400 -fill #eef -text "115"
.c create line 140 1400 140 1400 -fill #eef -dash {6 4}
.c create line 140 1392 140 1388 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 113 to 115 (Used 1 nobox 1)
# ProcLine[1] stays at 115 (Used 1 nobox 1)
.c create rectangle 20 1390 260 1410 -fill white -width 0
.c create text 140 1400 -text "Droite vers la case 1_2. "
.c create text 70 1424 -fill #eef -text "117"
.c create line 140 1424 140 1424 -fill #eef -dash {6 4}
.c create line 140 1416 140 1412 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 115 to 117 (Used 1 nobox 1)
# ProcLine[1] stays at 117 (Used 1 nobox 1)
.c create rectangle 20 1414 260 1434 -fill white -width 0
.c create text 140 1424 -text "Gauche vers la case 1_1. "
.c create text 70 1448 -fill #eef -text "119"
.c create line 140 1448 140 1448 -fill #eef -dash {6 4}
.c create line 140 1440 140 1436 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 117 to 119 (Used 1 nobox 1)
# ProcLine[1] stays at 119 (Used 1 nobox 1)
.c create rectangle 31 1438 249 1458 -fill white -width 0
.c create text 140 1448 -text "Haut vers la case 2_1. "
.c create text 70 1472 -fill #eef -text "121"
.c create line 140 1472 140 1472 -fill #eef -dash {6 4}
.c create line 140 1464 140 1460 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 119 to 121 (Used 1 nobox 1)
# ProcLine[1] stays at 121 (Used 1 nobox 1)
.c create rectangle 36 1462 244 1482 -fill white -width 0
.c create text 140 1472 -text "Bas vers la case 1_1. "
.c create text 70 1496 -fill #eef -text "123"
.c create line 140 1496 140 1496 -fill #eef -dash {6 4}
.c create line 140 1488 140 1484 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 121 to 123 (Used 1 nobox 1)
# ProcLine[1] stays at 123 (Used 1 nobox 1)
.c create rectangle 31 1486 249 1506 -fill white -width 0
.c create text 140 1496 -text "Haut vers la case 2_1. "
.c create text 70 1520 -fill #eef -text "125"
.c create line 140 1520 140 1520 -fill #eef -dash {6 4}
.c create line 140 1512 140 1508 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 123 to 125 (Used 1 nobox 1)
# ProcLine[1] stays at 125 (Used 1 nobox 1)
.c create rectangle 20 1510 260 1530 -fill white -width 0
.c create text 140 1520 -text "Gauche vers la case 2_0. "
.c create text 70 1544 -fill #eef -text "127"
.c create line 140 1544 140 1544 -fill #eef -dash {6 4}
.c create line 140 1536 140 1532 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 125 to 127 (Used 1 nobox 1)
# ProcLine[1] stays at 127 (Used 1 nobox 1)
.c create rectangle 20 1534 260 1554 -fill white -width 0
.c create text 140 1544 -text "Droite vers la case 2_1. "
.c create text 70 1568 -fill #eef -text "129"
.c create line 140 1568 140 1568 -fill #eef -dash {6 4}
.c create line 140 1560 140 1556 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 127 to 129 (Used 1 nobox 1)
# ProcLine[1] stays at 129 (Used 1 nobox 1)
.c create rectangle 31 1558 249 1578 -fill white -width 0
.c create text 140 1568 -text "Haut vers la case 3_1. "
.c create text 70 1592 -fill #eef -text "131"
.c create line 140 1592 140 1592 -fill #eef -dash {6 4}
.c create line 140 1584 140 1580 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 129 to 131 (Used 1 nobox 1)
# ProcLine[1] stays at 131 (Used 1 nobox 1)
.c create rectangle 36 1582 244 1602 -fill white -width 0
.c create text 140 1592 -text "Bas vers la case 2_1. "
.c create text 70 1616 -fill #eef -text "133"
.c create line 140 1616 140 1616 -fill #eef -dash {6 4}
.c create line 140 1608 140 1604 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 131 to 133 (Used 1 nobox 1)
# ProcLine[1] stays at 133 (Used 1 nobox 1)
.c create rectangle 36 1606 244 1626 -fill white -width 0
.c create text 140 1616 -text "Bas vers la case 1_1. "
.c create text 70 1640 -fill #eef -text "135"
.c create line 140 1640 140 1640 -fill #eef -dash {6 4}
.c create line 140 1632 140 1628 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 133 to 135 (Used 1 nobox 1)
# ProcLine[1] stays at 135 (Used 1 nobox 1)
.c create rectangle 20 1630 260 1650 -fill white -width 0
.c create text 140 1640 -text "Droite vers la case 1_2. "
.c create text 70 1664 -fill #eef -text "137"
.c create line 140 1664 140 1664 -fill #eef -dash {6 4}
.c create line 140 1656 140 1652 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 135 to 137 (Used 1 nobox 1)
# ProcLine[1] stays at 137 (Used 1 nobox 1)
.c create rectangle 20 1654 260 1674 -fill white -width 0
.c create text 140 1664 -text "Gauche vers la case 1_1. "
.c create text 70 1688 -fill #eef -text "139"
.c create line 140 1688 140 1688 -fill #eef -dash {6 4}
.c create line 140 1680 140 1676 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 137 to 139 (Used 1 nobox 1)
# ProcLine[1] stays at 139 (Used 1 nobox 1)
.c create rectangle 20 1678 260 1698 -fill white -width 0
.c create text 140 1688 -text "Droite vers la case 1_2. "
.c create text 70 1712 -fill #eef -text "141"
.c create line 140 1712 140 1712 -fill #eef -dash {6 4}
.c create line 140 1704 140 1700 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 139 to 141 (Used 1 nobox 1)
# ProcLine[1] stays at 141 (Used 1 nobox 1)
.c create rectangle 20 1702 260 1722 -fill white -width 0
.c create text 140 1712 -text "Gauche vers la case 1_1. "
.c create text 70 1736 -fill #eef -text "143"
.c create line 140 1736 140 1736 -fill #eef -dash {6 4}
.c create line 140 1728 140 1724 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 141 to 143 (Used 1 nobox 1)
# ProcLine[1] stays at 143 (Used 1 nobox 1)
.c create rectangle 31 1726 249 1746 -fill white -width 0
.c create text 140 1736 -text "Haut vers la case 2_1. "
.c create text 70 1760 -fill #eef -text "145"
.c create line 140 1760 140 1760 -fill #eef -dash {6 4}
.c create line 140 1752 140 1748 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 143 to 145 (Used 1 nobox 1)
# ProcLine[1] stays at 145 (Used 1 nobox 1)
.c create rectangle 31 1750 249 1770 -fill white -width 0
.c create text 140 1760 -text "Haut vers la case 3_1. "
.c create text 70 1784 -fill #eef -text "147"
.c create line 140 1784 140 1784 -fill #eef -dash {6 4}
.c create line 140 1776 140 1772 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 145 to 147 (Used 1 nobox 1)
# ProcLine[1] stays at 147 (Used 1 nobox 1)
.c create rectangle 20 1774 260 1794 -fill white -width 0
.c create text 140 1784 -text "Droite vers la case 3_2. "
.c create text 70 1808 -fill #eef -text "149"
.c create line 140 1808 140 1808 -fill #eef -dash {6 4}
.c create line 140 1800 140 1796 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 147 to 149 (Used 1 nobox 1)
# ProcLine[1] stays at 149 (Used 1 nobox 1)
.c create rectangle 20 1798 260 1818 -fill white -width 0
.c create text 140 1808 -text "Droite vers la case 3_3. "
.c create text 70 1832 -fill #eef -text "151"
.c create line 140 1832 140 1832 -fill #eef -dash {6 4}
.c create line 140 1824 140 1820 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 149 to 151 (Used 1 nobox 1)
# ProcLine[1] stays at 151 (Used 1 nobox 1)
.c create rectangle 31 1822 249 1842 -fill white -width 0
.c create text 140 1832 -text "Haut vers la case 4_3. "
.c create text 70 1856 -fill #eef -text "153"
.c create line 140 1856 140 1856 -fill #eef -dash {6 4}
.c create line 140 1848 140 1844 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 151 to 153 (Used 1 nobox 1)
# ProcLine[1] stays at 153 (Used 1 nobox 1)
.c create rectangle 36 1846 244 1866 -fill white -width 0
.c create text 140 1856 -text "Bas vers la case 3_3. "
.c create text 70 1880 -fill #eef -text "155"
.c create line 140 1880 140 1880 -fill #eef -dash {6 4}
.c create line 140 1872 140 1868 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 153 to 155 (Used 1 nobox 1)
# ProcLine[1] stays at 155 (Used 1 nobox 1)
.c create rectangle 31 1870 249 1890 -fill white -width 0
.c create text 140 1880 -text "Haut vers la case 4_3. "
.c create text 70 1904 -fill #eef -text "157"
.c create line 140 1904 140 1904 -fill #eef -dash {6 4}
.c create line 140 1896 140 1892 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 155 to 157 (Used 1 nobox 1)
# ProcLine[1] stays at 157 (Used 1 nobox 1)
.c create rectangle 36 1894 244 1914 -fill white -width 0
.c create text 140 1904 -text "Bas vers la case 3_3. "
.c create text 70 1928 -fill #eef -text "159"
.c create line 140 1928 140 1928 -fill #eef -dash {6 4}
.c create line 140 1920 140 1916 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 157 to 159 (Used 1 nobox 1)
# ProcLine[1] stays at 159 (Used 1 nobox 1)
.c create rectangle 31 1918 249 1938 -fill white -width 0
.c create text 140 1928 -text "Haut vers la case 4_3. "
.c create text 70 1952 -fill #eef -text "161"
.c create line 140 1952 140 1952 -fill #eef -dash {6 4}
.c create line 140 1944 140 1940 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 159 to 161 (Used 1 nobox 1)
# ProcLine[1] stays at 161 (Used 1 nobox 1)
.c create rectangle 20 1942 260 1962 -fill white -width 0
.c create text 140 1952 -text "Gauche vers la case 4_2. "
.c create text 70 1976 -fill #eef -text "163"
.c create line 140 1976 140 1976 -fill #eef -dash {6 4}
.c create line 140 1968 140 1964 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 161 to 163 (Used 1 nobox 1)
# ProcLine[1] stays at 163 (Used 1 nobox 1)
.c create rectangle 20 1966 260 1986 -fill white -width 0
.c create text 140 1976 -text "Gauche vers la case 4_1. "
.c create text 70 2000 -fill #eef -text "165"
.c create line 140 2000 140 2000 -fill #eef -dash {6 4}
.c create line 140 1992 140 1988 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 163 to 165 (Used 1 nobox 1)
# ProcLine[1] stays at 165 (Used 1 nobox 1)
.c create rectangle 20 1990 260 2010 -fill white -width 0
.c create text 140 2000 -text "Droite vers la case 4_2. "
.c create text 70 2024 -fill #eef -text "167"
.c create line 140 2024 140 2024 -fill #eef -dash {6 4}
.c create line 140 2016 140 2012 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 165 to 167 (Used 1 nobox 1)
# ProcLine[1] stays at 167 (Used 1 nobox 1)
.c create rectangle 20 2014 260 2034 -fill white -width 0
.c create text 140 2024 -text "Gauche vers la case 4_1. "
.c create text 70 2048 -fill #eef -text "169"
.c create line 140 2048 140 2048 -fill #eef -dash {6 4}
.c create line 140 2040 140 2036 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 167 to 169 (Used 1 nobox 1)
# ProcLine[1] stays at 169 (Used 1 nobox 1)
.c create rectangle 20 2038 260 2058 -fill white -width 0
.c create text 140 2048 -text "Gauche vers la case 4_0. "
.c create text 70 2072 -fill #eef -text "171"
.c create line 140 2072 140 2072 -fill #eef -dash {6 4}
.c create line 140 2064 140 2060 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 169 to 171 (Used 1 nobox 1)
# ProcLine[1] stays at 171 (Used 1 nobox 1)
.c create rectangle 103 2062 177 2082 -fill white -width 0
.c create text 140 2072 -text "Sortie. "
.c lower grid
.c raise mesg
