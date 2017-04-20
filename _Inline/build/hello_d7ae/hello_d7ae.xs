#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"

#include <time.h>

void get_localtime() {
    const time_t utc_ = (time_t)SvIV(utc);
    struct tm *ltime = localtime(&utc_);
    printf("Hello %s!\n", "mytest");
}

MODULE = hello_d7ae  PACKAGE = main  

PROTOTYPES: DISABLE


void
get_localtime ()
        PREINIT:
        I32* temp;
        PPCODE:
        temp = PL_markstack_ptr++;
        get_localtime();
        if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
          PL_markstack_ptr = temp;
          XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
        return; /* assume stack size is correct */

