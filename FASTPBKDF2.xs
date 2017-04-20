#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#include "fastpbkdf2/fastpbkdf2.h"

MODULE = Crypt::OpenSSL::FASTPBKDF2		PACKAGE = Crypt::OpenSSL::FASTPBKDF2
PROTOTYPES: DISABLE

void
hello()
	PREINIT:
        char *pw = "password";
        char *salt = "salt";
        uint8_t out[64];
    CODE:
        fastpbkdf2_hmac_sha512(pw, strlen(pw), salt, strlen(salt), 1, out, sizeof out);
        printf("pbkdf2 %s > %s\n", pw, out);

int
is_even(int x)
    CODE:
        RETVAL = (x % 2 == 0);
    OUTPUT:
        RETVAL

void
round(double arg)
    CODE:
        if (arg > 0.0) {
                arg = floor(arg + 0.5);
        } else if (arg < 0.0) {
                arg = ceil(arg - 0.5);
        } else {
                arg = 0.0;
        }
    OUTPUT:
        arg