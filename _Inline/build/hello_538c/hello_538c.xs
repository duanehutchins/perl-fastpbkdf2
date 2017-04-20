#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
##

#include <openssl/evp.h>
#include "/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2/fastpbkdf2/fastpbkdf2.h"

#define PASSWORD (const void *) "password", 8
#define SALT (const void *) "saltsalt", 8
#define WARMUP 4096
#define ITERATIONS (1 << 22)

#include <time.h>

void get_localtime(SV * utc) {
    const time_t utc_ = (time_t)SvIV(utc);
    struct tm *ltime = localtime(&utc_);
    Inline_Stack_Vars;

    Inline_Stack_Reset;
    Inline_Stack_Push(sv_2mortal(newSViv(ltime->tm_year)));
    Inline_Stack_Push(sv_2mortal(newSViv(ltime->tm_mon)));
    Inline_Stack_Push(sv_2mortal(newSViv(ltime->tm_mday)));
    Inline_Stack_Push(sv_2mortal(newSViv(ltime->tm_hour)));
    Inline_Stack_Push(sv_2mortal(newSViv(ltime->tm_min)));
    Inline_Stack_Push(sv_2mortal(newSViv(ltime->tm_sec)));
    Inline_Stack_Push(sv_2mortal(newSViv(ltime->tm_isdst)));
    Inline_Stack_Done;
}

void hello() {
    uint8_t out[64];
    printf("Hello %s!\n", "mytest");
    PKCS5_PBKDF2_HMAC(PASSWORD, SALT, 1, EVP_sha512(), (int) sizeof(out), out);
    printf("pbkdf2 %s!\n", out);
    fastpbkdf2_hmac_sha512(PASSWORD, SALT, 1, out, sizeof out);
}

MODULE = hello_538c  PACKAGE = main  

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

void
hello ()
        PREINIT:
        I32* temp;
        PPCODE:
        temp = PL_markstack_ptr++;
        hello();
        if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
          PL_markstack_ptr = temp;
          XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
        return; /* assume stack size is correct */

