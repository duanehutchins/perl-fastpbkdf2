#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#include "fastpbkdf2/fastpbkdf2.h"

MODULE = Crypt::OpenSSL::FASTPBKDF2		PACKAGE = Crypt::OpenSSL::FASTPBKDF2
PROTOTYPES: ENABLE

SV *
fastpbkdf2_hmac_interface(pw, salt, iterations, nout, IN_OUT data_buffer = NO_INIT)
        const uint8_t *pw
        const uint8_t *salt
        uint32_t iterations
        STRLEN nout
        AV * &data_buffer
    PROTOTYPE: $$$$;\@
    PREINIT:
        uint8_t * hashPtr;
        SV * hash = newSVpv("",0);
    INIT:
        Newx(hashPtr, nout+1, uint8_t);
        sv_usepvn_flags(hash, hashPtr, nout, SV_SMAGIC | SV_HAS_TRAILING_NUL);
    C_ARGS:
        pw, strlen(pw), salt, strlen(salt), iterations, hashPtr, nout
    INTERFACE:
        fastpbkdf2_hmac_sha1 fastpbkdf2_hmac_sha256 fastpbkdf2_hmac_sha512
	POSTCALL:
        if(ST(5)) av_push(data_buffer, newSVpvn(hashPtr, nout)); // Append to @data_buffer array, if provided
        hashPtr[nout] = '\0'; // NUL-terminated string
        RETVAL = hash;