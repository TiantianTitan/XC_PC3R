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

		 /* PROC :init: */
	case 3: // STATE 1 - ./tme4_parite1.pml:91 - [(run Producteur())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - ./tme4_parite1.pml:92 - [(run Gestionnaire())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - ./tme4_parite1.pml:93 - [(run Ouvrier())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - ./tme4_parite1.pml:94 - [(run Collecteur())] (0:0:0 - 1)
		IfNotBlocked
		reached[4][4] = 1;
		if (!(addproc(II, 1, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - ./tme4_parite1.pml:95 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Collecteur */
	case 8: // STATE 1 - ./tme4_parite1.pml:83 - [ouvToColl?statut,id] (0:0:3 - 1)
		reached[3][1] = 1;
		if (boq != now.ouvToColl) continue;
		if (q_len(now.ouvToColl) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P3 *)_this)->statut;
		(trpt+1)->bup.ovals[1] = ((P3 *)_this)->id;
		;
		((P3 *)_this)->statut = qrecv(now.ouvToColl, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Collecteur:statut", ((P3 *)_this)->statut);
#endif
		;
		((P3 *)_this)->id = qrecv(now.ouvToColl, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Collecteur:id", ((P3 *)_this)->id);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.ouvToColl);
		sprintf(simtmp, "%d", ((P3 *)_this)->statut); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P3 *)_this)->id); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.ouvToColl))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: statut */  (trpt+1)->bup.ovals[2] = ((P3 *)_this)->statut;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P3 *)_this)->statut = 0;
		_m = 4; goto P999; /* 0 */
	case 9: // STATE 2 - ./tme4_parite1.pml:85 - [printf('Packet %d collected\\n',id)] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		Printf("Packet %d collected\n", ((P3 *)_this)->id);
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 6 - ./tme4_parite1.pml:87 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Ouvrier */
	case 11: // STATE 1 - ./tme4_parite1.pml:66 - [gestToOuv?statut,id] (0:0:2 - 1)
		reached[2][1] = 1;
		if (boq != now.gestToOuv) continue;
		if (q_len(now.gestToOuv) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->statut;
		(trpt+1)->bup.ovals[1] = ((P2 *)_this)->id;
		;
		((P2 *)_this)->statut = qrecv(now.gestToOuv, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Ouvrier:statut", ((P2 *)_this)->statut);
#endif
		;
		((P2 *)_this)->id = qrecv(now.gestToOuv, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Ouvrier:id", ((P2 *)_this)->id);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.gestToOuv);
		sprintf(simtmp, "%d", ((P2 *)_this)->statut); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->id); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.gestToOuv))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 12: // STATE 2 - ./tme4_parite1.pml:69 - [((statut==V))] (0:0:1 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!((((P2 *)_this)->statut==4)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: statut */  (trpt+1)->bup.oval = ((P2 *)_this)->statut;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->statut = 0;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 3 - ./tme4_parite1.pml:71 - [ouvToGest!R,id] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (q_len(now.ouvToGest))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ouvToGest);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->id); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ouvToGest, 0, 3, ((P2 *)_this)->id, 2);
		{ boq = now.ouvToGest; };
		_m = 2; goto P999; /* 0 */
	case 14: // STATE 4 - ./tme4_parite1.pml:72 - [((statut==R))] (0:0:1 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((P2 *)_this)->statut==3)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: statut */  (trpt+1)->bup.oval = ((P2 *)_this)->statut;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->statut = 0;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 5 - ./tme4_parite1.pml:74 - [ouvToGest!C,id] (0:0:0 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		if (q_len(now.ouvToGest))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ouvToGest);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P2 *)_this)->id); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ouvToGest, 0, 2, ((P2 *)_this)->id, 2);
		{ boq = now.ouvToGest; };
		_m = 2; goto P999; /* 0 */
	case 16: // STATE 11 - ./tme4_parite1.pml:77 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Gestionnaire */
	case 17: // STATE 1 - ./tme4_parite1.pml:40 - [prodToGest?statut,id] (0:0:2 - 1)
		reached[1][1] = 1;
		if (boq != now.prodToGest) continue;
		if (q_len(now.prodToGest) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->statut;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->id;
		;
		((P1 *)_this)->statut = qrecv(now.prodToGest, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Gestionnaire:statut", ((P1 *)_this)->statut);
#endif
		;
		((P1 *)_this)->id = qrecv(now.prodToGest, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Gestionnaire:id", ((P1 *)_this)->id);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.prodToGest);
		sprintf(simtmp, "%d", ((P1 *)_this)->statut); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->id); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.prodToGest))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 18: // STATE 2 - ./tme4_parite1.pml:42 - [((gestQueueSize>0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((now.gestQueueSize>0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 3 - ./tme4_parite1.pml:43 - [gestToOuv!statut,id] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (q_len(now.gestToOuv))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.gestToOuv);
		sprintf(simtmp, "%d", ((P1 *)_this)->statut); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->id); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.gestToOuv, 0, ((P1 *)_this)->statut, ((P1 *)_this)->id, 2);
		{ boq = now.gestToOuv; };
		_m = 2; goto P999; /* 0 */
	case 20: // STATE 4 - ./tme4_parite1.pml:44 - [gestQueueSize = (gestQueueSize-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.oval = now.gestQueueSize;
		now.gestQueueSize = (now.gestQueueSize-1);
#ifdef VAR_RANGES
		logval("gestQueueSize", now.gestQueueSize);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 9 - ./tme4_parite1.pml:47 - [ouvToGest?statut,id] (0:0:2 - 1)
		reached[1][9] = 1;
		if (boq != now.ouvToGest) continue;
		if (q_len(now.ouvToGest) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->statut;
		(trpt+1)->bup.ovals[1] = ((P1 *)_this)->id;
		;
		((P1 *)_this)->statut = qrecv(now.ouvToGest, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("Gestionnaire:statut", ((P1 *)_this)->statut);
#endif
		;
		((P1 *)_this)->id = qrecv(now.ouvToGest, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Gestionnaire:id", ((P1 *)_this)->id);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.ouvToGest);
		sprintf(simtmp, "%d", ((P1 *)_this)->statut); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->id); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.ouvToGest))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 22: // STATE 10 - ./tme4_parite1.pml:49 - [((statut==C))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (!((((P1 *)_this)->statut==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 11 - ./tme4_parite1.pml:50 - [ouvToColl!statut,id] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (q_len(now.ouvToColl))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.ouvToColl);
		sprintf(simtmp, "%d", ((P1 *)_this)->statut); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->id); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.ouvToColl, 0, ((P1 *)_this)->statut, ((P1 *)_this)->id, 2);
		{ boq = now.ouvToColl; };
		_m = 2; goto P999; /* 0 */
	case 24: // STATE 13 - ./tme4_parite1.pml:53 - [((gestQueueSize<5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!((now.gestQueueSize<5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 14 - ./tme4_parite1.pml:54 - [gestToOuv!statut,id] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (q_len(now.gestToOuv))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.gestToOuv);
		sprintf(simtmp, "%d", ((P1 *)_this)->statut); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->id); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.gestToOuv, 0, ((P1 *)_this)->statut, ((P1 *)_this)->id, 2);
		{ boq = now.gestToOuv; };
		_m = 2; goto P999; /* 0 */
	case 26: // STATE 15 - ./tme4_parite1.pml:55 - [gestQueueSize = (gestQueueSize+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][15] = 1;
		(trpt+1)->bup.oval = now.gestQueueSize;
		now.gestQueueSize = (now.gestQueueSize+1);
#ifdef VAR_RANGES
		logval("gestQueueSize", now.gestQueueSize);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 25 - ./tme4_parite1.pml:60 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][25] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Producteur */
	case 28: // STATE 2 - ./tme4_parite1.pml:27 - [((gestQueueSize<5))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((now.gestQueueSize<5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 3 - ./tme4_parite1.pml:28 - [prodToGest!V,id] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (q_len(now.prodToGest))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.prodToGest);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->id); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.prodToGest, 0, 4, ((P0 *)_this)->id, 2);
		{ boq = now.prodToGest; };
		_m = 2; goto P999; /* 0 */
	case 30: // STATE 4 - ./tme4_parite1.pml:29 - [id = (id+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->id;
		((P0 *)_this)->id = (((P0 *)_this)->id+1);
#ifdef VAR_RANGES
		logval("Producteur:id", ((P0 *)_this)->id);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 5 - ./tme4_parite1.pml:30 - [gestQueueSize = (gestQueueSize+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = now.gestQueueSize;
		now.gestQueueSize = (now.gestQueueSize+1);
#ifdef VAR_RANGES
		logval("gestQueueSize", now.gestQueueSize);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 13 - ./tme4_parite1.pml:34 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
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

