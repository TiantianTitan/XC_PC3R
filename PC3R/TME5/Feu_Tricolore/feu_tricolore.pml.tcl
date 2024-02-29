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
.c create line 140 48 140 68 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 1 to 5 (Used 1 nobox 1)
# ProcLine[1] stays at 5 (Used 1 nobox 1)
.c create rectangle 68 70 212 90 -fill white -width 0
.c create text 140 80 -text "observe!ROUGE,0"
.c create line 140 90 220 90 -fill darkred -tags mesg -width 2
.c create line 220 90 300 90 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 104 -fill #eef -text "7"
.c create line 140 104 300 104 -fill #eef -dash {6 4}
.c create line 300 72 300 92 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 3 to 7 (Used 1 nobox 1)
# ProcLine[2] stays at 7 (Used 1 nobox 1)
.c create rectangle 228 94 372 114 -fill white -width 0
.c create text 300 104 -text "observe?ROUGE,0"
.c create text 70 128 -fill #eef -text "9"
.c create line 140 128 300 128 -fill #eef -dash {6 4}
.c create line 140 96 140 116 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[1] from 5 to 9 (Used 1 nobox 1)
# ProcLine[1] stays at 9 (Used 1 nobox 1)
.c create rectangle 68 118 212 138 -fill white -width 0
.c create text 140 128 -text "observe!ROUGE,0"
.c create line 140 138 220 138 -fill darkred -tags mesg -width 2
.c create line 220 138 300 138 -fill darkred -width 2 -arrow both -arrowshape {5 5 5} -tags mesg
.c raise mesg
.c create text 70 152 -fill #eef -text "11"
.c create line 140 152 300 152 -fill #eef -dash {6 4}
.c create line 300 120 300 140 -fill lightgrey -tags grid -width 1 
.c lower grid
# ProcLine[2] from 7 to 11 (Used 1 nobox 1)
# ProcLine[2] stays at 11 (Used 1 nobox 1)
.c create rectangle 228 142 372 162 -fill white -width 0
.c create text 300 152 -text "observe?ROUGE,0"
.c lower grid
.c raise mesg
