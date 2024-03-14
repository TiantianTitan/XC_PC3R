#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC labyrinthe */
	case 3: // STATE 1 - labyrinthe.pml:19 - [(1)] (137:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!(1))
			continue;
		/* merge: printf('Début à la case 0_4. ')(0, 2, 137) */
		reached[0][2] = 1;
		Printf("Début à la case 0_4. ");
		/* merge: goto case_0_4(0, 3, 137) */
		reached[0][3] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 4: // STATE 6 - labyrinthe.pml:24 - [(1)] (55:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 2_1. ')(0, 7, 55) */
		reached[0][7] = 1;
		Printf("Droite vers la case 2_1. ");
		/* merge: goto case_2_1(0, 8, 55) */
		reached[0][8] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 5: // STATE 11 - labyrinthe.pml:29 - [(1)] (25:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!(1))
			continue;
		/* merge: printf('Haut vers la case 1_4. ')(0, 12, 25) */
		reached[0][12] = 1;
		Printf("Haut vers la case 1_4. ");
		/* merge: goto case_4_0(0, 13, 25) */
		reached[0][13] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 6: // STATE 16 - labyrinthe.pml:34 - [(1)] (33:0:0 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (!(1))
			continue;
		/* merge: printf('Sortie. ')(33, 17, 33) */
		reached[0][17] = 1;
		Printf("Sortie. ");
		/* merge: assert(0)(33, 18, 33) */
		reached[0][18] = 1;
		spin_assert(0, "0", II, tt, t);
		/* merge: .(goto)(0, 26, 33) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 7: // STATE 19 - labyrinthe.pml:35 - [(1)] (71:0:0 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 4_1. ')(0, 20, 71) */
		reached[0][20] = 1;
		Printf("Droite vers la case 4_1. ");
		/* merge: goto case_4_1(0, 21, 71) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 8: // STATE 22 - labyrinthe.pml:36 - [(1)] (14:0:0 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		if (!(1))
			continue;
		/* merge: printf('Bas vers la case 3_0. ')(0, 23, 14) */
		reached[0][23] = 1;
		Printf("Bas vers la case 3_0. ");
		/* merge: goto case_3_0(0, 24, 14) */
		reached[0][24] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 9: // STATE 27 - labyrinthe.pml:42 - [(1)] (44:0:0 - 1)
		IfNotBlocked
		reached[0][27] = 1;
		if (!(1))
			continue;
		/* merge: printf('Haut vers la case 1_1. ')(0, 28, 44) */
		reached[0][28] = 1;
		Printf("Haut vers la case 1_1. ");
		/* merge: goto case_1_1(0, 29, 44) */
		reached[0][29] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 10: // STATE 30 - labyrinthe.pml:43 - [(1)] (79:0:0 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 0_2. ')(0, 31, 79) */
		reached[0][31] = 1;
		Printf("Droite vers la case 0_2. ");
		/* merge: goto case_0_2(0, 32, 79) */
		reached[0][32] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 11: // STATE 35 - labyrinthe.pml:48 - [(1)] (55:0:0 - 1)
		IfNotBlocked
		reached[0][35] = 1;
		if (!(1))
			continue;
		/* merge: printf('Haut vers la case 2_1. ')(0, 36, 55) */
		reached[0][36] = 1;
		Printf("Haut vers la case 2_1. ");
		/* merge: goto case_2_1(0, 37, 55) */
		reached[0][37] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 12: // STATE 38 - labyrinthe.pml:49 - [(1)] (87:0:0 - 1)
		IfNotBlocked
		reached[0][38] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 1_2. ')(0, 39, 87) */
		reached[0][39] = 1;
		Printf("Droite vers la case 1_2. ");
		/* merge: goto case_1_2(0, 40, 87) */
		reached[0][40] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 13: // STATE 41 - labyrinthe.pml:50 - [(1)] (33:0:0 - 1)
		IfNotBlocked
		reached[0][41] = 1;
		if (!(1))
			continue;
		/* merge: printf('Bas vers la case 0_1. ')(0, 42, 33) */
		reached[0][42] = 1;
		Printf("Bas vers la case 0_1. ");
		/* merge: goto case_0_1(0, 43, 33) */
		reached[0][43] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 14: // STATE 46 - labyrinthe.pml:55 - [(1)] (63:0:0 - 1)
		IfNotBlocked
		reached[0][46] = 1;
		if (!(1))
			continue;
		/* merge: printf('Haut vers la case 3_1. ')(0, 47, 63) */
		reached[0][47] = 1;
		Printf("Haut vers la case 3_1. ");
		/* merge: goto case_3_1(0, 48, 63) */
		reached[0][48] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 15: // STATE 49 - labyrinthe.pml:56 - [(1)] (9:0:0 - 1)
		IfNotBlocked
		reached[0][49] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 2_0. ')(0, 50, 9) */
		reached[0][50] = 1;
		Printf("Gauche vers la case 2_0. ");
		/* merge: goto case_2_0(0, 51, 9) */
		reached[0][51] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 16: // STATE 52 - labyrinthe.pml:57 - [(1)] (44:0:0 - 1)
		IfNotBlocked
		reached[0][52] = 1;
		if (!(1))
			continue;
		/* merge: printf('Bas vers la case 1_1. ')(0, 53, 44) */
		reached[0][53] = 1;
		Printf("Bas vers la case 1_1. ");
		/* merge: goto case_1_1(0, 54, 44) */
		reached[0][54] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 17: // STATE 57 - labyrinthe.pml:62 - [(1)] (95:0:0 - 1)
		IfNotBlocked
		reached[0][57] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 3_2. ')(0, 58, 95) */
		reached[0][58] = 1;
		Printf("Droite vers la case 3_2. ");
		/* merge: goto case_3_2(0, 59, 95) */
		reached[0][59] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 18: // STATE 60 - labyrinthe.pml:63 - [(1)] (55:0:0 - 1)
		IfNotBlocked
		reached[0][60] = 1;
		if (!(1))
			continue;
		/* merge: printf('Bas vers la case 2_1. ')(0, 61, 55) */
		reached[0][61] = 1;
		Printf("Bas vers la case 2_1. ");
		/* merge: goto case_2_1(0, 62, 55) */
		reached[0][62] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 19: // STATE 65 - labyrinthe.pml:68 - [(1)] (25:0:0 - 1)
		IfNotBlocked
		reached[0][65] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 4_0. ')(0, 66, 25) */
		reached[0][66] = 1;
		Printf("Gauche vers la case 4_0. ");
		/* merge: goto case_4_0(0, 67, 25) */
		reached[0][67] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 20: // STATE 68 - labyrinthe.pml:69 - [(1)] (103:0:0 - 1)
		IfNotBlocked
		reached[0][68] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 4_2. ')(0, 69, 103) */
		reached[0][69] = 1;
		Printf("Droite vers la case 4_2. ");
		/* merge: goto case_4_2(0, 70, 103) */
		reached[0][70] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 21: // STATE 73 - labyrinthe.pml:75 - [(1)] (33:0:0 - 1)
		IfNotBlocked
		reached[0][73] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 0_1. ')(0, 74, 33) */
		reached[0][74] = 1;
		Printf("Gauche vers la case 0_1. ");
		/* merge: goto case_0_1(0, 75, 33) */
		reached[0][75] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 22: // STATE 76 - labyrinthe.pml:76 - [(1)] (108:0:0 - 1)
		IfNotBlocked
		reached[0][76] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 0_3. ')(0, 77, 108) */
		reached[0][77] = 1;
		Printf("Droite vers la case 0_3. ");
		/* merge: goto case_0_3(0, 78, 108) */
		reached[0][78] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 81 - labyrinthe.pml:81 - [(1)] (44:0:0 - 1)
		IfNotBlocked
		reached[0][81] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 1_1. ')(0, 82, 44) */
		reached[0][82] = 1;
		Printf("Gauche vers la case 1_1. ");
		/* merge: goto case_1_1(0, 83, 44) */
		reached[0][83] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 24: // STATE 84 - labyrinthe.pml:82 - [(1)] (116:0:0 - 1)
		IfNotBlocked
		reached[0][84] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 1_3. ')(0, 85, 116) */
		reached[0][85] = 1;
		Printf("Droite vers la case 1_3. ");
		/* merge: goto case_1_3(0, 86, 116) */
		reached[0][86] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 25: // STATE 89 - labyrinthe.pml:87 - [(1)] (63:0:0 - 1)
		IfNotBlocked
		reached[0][89] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 3_1. ')(0, 90, 63) */
		reached[0][90] = 1;
		Printf("Gauche vers la case 3_1. ");
		/* merge: goto case_3_1(0, 91, 63) */
		reached[0][91] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 26: // STATE 92 - labyrinthe.pml:88 - [(1)] (124:0:0 - 1)
		IfNotBlocked
		reached[0][92] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 3_3. ')(0, 93, 124) */
		reached[0][93] = 1;
		Printf("Droite vers la case 3_3. ");
		/* merge: goto case_3_3(0, 94, 124) */
		reached[0][94] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 27: // STATE 97 - labyrinthe.pml:93 - [(1)] (71:0:0 - 1)
		IfNotBlocked
		reached[0][97] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 4_1. ')(0, 98, 71) */
		reached[0][98] = 1;
		Printf("Gauche vers la case 4_1. ");
		/* merge: goto case_4_1(0, 99, 71) */
		reached[0][99] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 28: // STATE 100 - labyrinthe.pml:94 - [(1)] (132:0:0 - 1)
		IfNotBlocked
		reached[0][100] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 4_3. ')(0, 101, 132) */
		reached[0][101] = 1;
		Printf("Droite vers la case 4_3. ");
		/* merge: goto case_4_3(0, 102, 132) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 29: // STATE 105 - labyrinthe.pml:100 - [(1)] (79:0:0 - 1)
		IfNotBlocked
		reached[0][105] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 0_2. ')(0, 106, 79) */
		reached[0][106] = 1;
		Printf("Gauche vers la case 0_2. ");
		/* merge: goto case_0_2(0, 107, 79) */
		reached[0][107] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 30: // STATE 110 - labyrinthe.pml:105 - [(1)] (87:0:0 - 1)
		IfNotBlocked
		reached[0][110] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 1_2. ')(0, 111, 87) */
		reached[0][111] = 1;
		Printf("Gauche vers la case 1_2. ");
		/* merge: goto case_1_2(0, 112, 87) */
		reached[0][112] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 31: // STATE 113 - labyrinthe.pml:106 - [(1)] (148:0:0 - 1)
		IfNotBlocked
		reached[0][113] = 1;
		if (!(1))
			continue;
		/* merge: printf('Droite vers la case 1_4. ')(0, 114, 148) */
		reached[0][114] = 1;
		Printf("Droite vers la case 1_4. ");
		/* merge: goto case_1_4(0, 115, 148) */
		reached[0][115] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 32: // STATE 118 - labyrinthe.pml:111 - [(1)] (95:0:0 - 1)
		IfNotBlocked
		reached[0][118] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 3_2. ')(0, 119, 95) */
		reached[0][119] = 1;
		Printf("Gauche vers la case 3_2. ");
		/* merge: goto case_3_2(0, 120, 95) */
		reached[0][120] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 33: // STATE 121 - labyrinthe.pml:112 - [(1)] (132:0:0 - 1)
		IfNotBlocked
		reached[0][121] = 1;
		if (!(1))
			continue;
		/* merge: printf('Haut vers la case 4_3. ')(0, 122, 132) */
		reached[0][122] = 1;
		Printf("Haut vers la case 4_3. ");
		/* merge: goto case_4_3(0, 123, 132) */
		reached[0][123] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 34: // STATE 126 - labyrinthe.pml:117 - [(1)] (124:0:0 - 1)
		IfNotBlocked
		reached[0][126] = 1;
		if (!(1))
			continue;
		/* merge: printf('Bas vers la case 3_3. ')(0, 127, 124) */
		reached[0][127] = 1;
		Printf("Bas vers la case 3_3. ");
		/* merge: goto case_3_3(0, 128, 124) */
		reached[0][128] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 35: // STATE 129 - labyrinthe.pml:118 - [(1)] (103:0:0 - 1)
		IfNotBlocked
		reached[0][129] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 4_2. ')(0, 130, 103) */
		reached[0][130] = 1;
		Printf("Gauche vers la case 4_2. ");
		/* merge: goto case_4_2(0, 131, 103) */
		reached[0][131] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 36: // STATE 134 - labyrinthe.pml:123 - [(1)] (148:0:0 - 1)
		IfNotBlocked
		reached[0][134] = 1;
		if (!(1))
			continue;
		/* merge: printf('Haut vers la case 1_4. ')(0, 135, 148) */
		reached[0][135] = 1;
		Printf("Haut vers la case 1_4. ");
		/* merge: goto case_1_4(0, 136, 148) */
		reached[0][136] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 37: // STATE 139 - labyrinthe.pml:128 - [(1)] (137:0:0 - 1)
		IfNotBlocked
		reached[0][139] = 1;
		if (!(1))
			continue;
		/* merge: printf('Bas vers la case 0_4. ')(0, 140, 137) */
		reached[0][140] = 1;
		Printf("Bas vers la case 0_4. ");
		/* merge: goto case_0_4(0, 141, 137) */
		reached[0][141] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 38: // STATE 142 - labyrinthe.pml:129 - [(1)] (116:0:0 - 1)
		IfNotBlocked
		reached[0][142] = 1;
		if (!(1))
			continue;
		/* merge: printf('Gauche vers la case 1_3. ')(0, 143, 116) */
		reached[0][143] = 1;
		Printf("Gauche vers la case 1_3. ");
		/* merge: goto case_1_3(0, 144, 116) */
		reached[0][144] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 39: // STATE 145 - labyrinthe.pml:130 - [(1)] (156:0:0 - 1)
		IfNotBlocked
		reached[0][145] = 1;
		if (!(1))
			continue;
		/* merge: printf('Haut vers la case 2_4. ')(0, 146, 156) */
		reached[0][146] = 1;
		Printf("Haut vers la case 2_4. ");
		/* merge: goto case_2_4(0, 147, 156) */
		reached[0][147] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 40: // STATE 150 - labyrinthe.pml:135 - [(1)] (164:0:0 - 1)
		IfNotBlocked
		reached[0][150] = 1;
		if (!(1))
			continue;
		/* merge: printf('Haut vers la case 3_4. ')(0, 151, 164) */
		reached[0][151] = 1;
		Printf("Haut vers la case 3_4. ");
		/* merge: goto case_3_4(0, 152, 164) */
		reached[0][152] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 41: // STATE 153 - labyrinthe.pml:136 - [(1)] (148:0:0 - 1)
		IfNotBlocked
		reached[0][153] = 1;
		if (!(1))
			continue;
		/* merge: printf('Bas vers la case 1_4. ')(0, 154, 148) */
		reached[0][154] = 1;
		Printf("Bas vers la case 1_4. ");
		/* merge: goto case_1_4(0, 155, 148) */
		reached[0][155] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 42: // STATE 158 - labyrinthe.pml:141 - [(1)] (169:0:0 - 1)
		IfNotBlocked
		reached[0][158] = 1;
		if (!(1))
			continue;
		/* merge: printf('Haut vers la case 4_4. ')(0, 159, 169) */
		reached[0][159] = 1;
		Printf("Haut vers la case 4_4. ");
		/* merge: goto case_4_4(0, 160, 169) */
		reached[0][160] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 43: // STATE 161 - labyrinthe.pml:142 - [(1)] (156:0:0 - 1)
		IfNotBlocked
		reached[0][161] = 1;
		if (!(1))
			continue;
		/* merge: printf('Bas vers la case 2_4. ')(0, 162, 156) */
		reached[0][162] = 1;
		Printf("Bas vers la case 2_4. ");
		/* merge: goto case_2_4(0, 163, 156) */
		reached[0][163] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 44: // STATE 166 - labyrinthe.pml:147 - [(1)] (164:0:0 - 1)
		IfNotBlocked
		reached[0][166] = 1;
		if (!(1))
			continue;
		/* merge: printf('Bas vers la case 3_4. ')(0, 167, 164) */
		reached[0][167] = 1;
		Printf("Bas vers la case 3_4. ");
		/* merge: goto case_3_4(0, 168, 164) */
		reached[0][168] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 45: // STATE 171 - labyrinthe.pml:149 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][171] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

