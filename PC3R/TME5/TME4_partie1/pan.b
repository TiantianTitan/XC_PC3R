	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 6: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: // STATE 5
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Collecteur */

	case 8: // STATE 1
		;
	/* 0 */	((P3 *)_this)->statut = trpt->bup.ovals[2];
		XX = 1;
		unrecv(now.ouvToColl, XX-1, 0, ((P3 *)_this)->statut, 1);
		unrecv(now.ouvToColl, XX-1, 1, ((P3 *)_this)->id, 0);
		((P3 *)_this)->statut = trpt->bup.ovals[0];
		((P3 *)_this)->id = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		;
		
	case 10: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Ouvrier */

	case 11: // STATE 1
		;
		XX = 1;
		unrecv(now.gestToOuv, XX-1, 0, ((P2 *)_this)->statut, 1);
		unrecv(now.gestToOuv, XX-1, 1, ((P2 *)_this)->id, 0);
		((P2 *)_this)->statut = trpt->bup.ovals[0];
		((P2 *)_this)->id = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 12: // STATE 2
		;
	/* 0 */	((P2 *)_this)->statut = trpt->bup.oval;
		;
		;
		goto R999;

	case 13: // STATE 3
		;
		_m = unsend(now.ouvToGest);
		;
		goto R999;

	case 14: // STATE 4
		;
	/* 0 */	((P2 *)_this)->statut = trpt->bup.oval;
		;
		;
		goto R999;

	case 15: // STATE 5
		;
		_m = unsend(now.ouvToGest);
		;
		goto R999;

	case 16: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Gestionnaire */

	case 17: // STATE 1
		;
		XX = 1;
		unrecv(now.prodToGest, XX-1, 0, ((P1 *)_this)->statut, 1);
		unrecv(now.prodToGest, XX-1, 1, ((P1 *)_this)->id, 0);
		((P1 *)_this)->statut = trpt->bup.ovals[0];
		((P1 *)_this)->id = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 19: // STATE 3
		;
		_m = unsend(now.gestToOuv);
		;
		goto R999;

	case 20: // STATE 4
		;
		now.gestQueueSize = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 9
		;
		XX = 1;
		unrecv(now.ouvToGest, XX-1, 0, ((P1 *)_this)->statut, 1);
		unrecv(now.ouvToGest, XX-1, 1, ((P1 *)_this)->id, 0);
		((P1 *)_this)->statut = trpt->bup.ovals[0];
		((P1 *)_this)->id = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 23: // STATE 11
		;
		_m = unsend(now.ouvToColl);
		;
		goto R999;
;
		;
		
	case 25: // STATE 14
		;
		_m = unsend(now.gestToOuv);
		;
		goto R999;

	case 26: // STATE 15
		;
		now.gestQueueSize = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 25
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Producteur */
;
		;
		
	case 29: // STATE 3
		;
		_m = unsend(now.prodToGest);
		;
		goto R999;

	case 30: // STATE 4
		;
		((P0 *)_this)->id = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 5
		;
		now.gestQueueSize = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;
	}

