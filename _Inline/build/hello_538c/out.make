Running Mkbootstrap for hello_538c ()
chmod 644 hello_538c.bs
/usr/bin/perl /usr/share/perl/5.20/ExtUtils/xsubpp  -typemap "/usr/share/perl/5.20/ExtUtils/typemap" -typemap "/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2/typemap"   hello_538c.xs > hello_538c.xsc && mv hello_538c.xsc hello_538c.c
cc -c  -I"/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2" -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fwrapv -fno-strict-aliasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g   -DVERSION=\"0.00\" -DXS_VERSION=\"0.00\" -fPIC "-I/usr/lib/x86_64-linux-gnu/perl/5.20/CORE"   hello_538c.c
hello_538c.xs:9:1: error: stray ‘##’ in program
 ##
 ^
Makefile:333: recipe for target 'hello_538c.o' failed
make: *** [hello_538c.o] Error 1
