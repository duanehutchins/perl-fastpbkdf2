#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"

#include <time.h>

void get_localtime(SV * utc) {
    const time_t utc_ = (time_t)SvIV(utc);
    struct tm *ltime = localtime(&utc_);
    Inline_Stack_Vars;

    Inline_Stack_Reset;
    Inline_Stack_Push(sv_2mortal(newSViv(ltime->tm_year)));
    Inline_Stack_Done;
    printf("Hello %s!\n", name);
}

MODULE = hello_5a6b  PACKAGE = main  

PROTOTYPES: DISABLE


void
get_localtime (utc)
	SV *	utc
        PREINIT:
        I32* temp;
        PPCODE:
        temp = PL_markstack_ptr++;
        get_localtime(utc);
        if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
          PL_markstack_ptr = temp;
          XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
        return; /* assume stack size is correct */

