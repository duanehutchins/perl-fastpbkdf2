Running Mkbootstrap for hello_5a6b ()
chmod 644 hello_5a6b.bs
/usr/bin/perl /usr/share/perl/5.20/ExtUtils/xsubpp  -typemap "/usr/share/perl/5.20/ExtUtils/typemap" -typemap "/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2/typemap"   hello_5a6b.xs > hello_5a6b.xsc && mv hello_5a6b.xsc hello_5a6b.c
cc -c  -I"/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2" -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fwrapv -fno-strict-aliasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g   -DVERSION=\"0.00\" -DXS_VERSION=\"0.00\" -fPIC "-I/usr/lib/x86_64-linux-gnu/perl/5.20/CORE"   hello_5a6b.c
hello_5a6b.xs: In function ‘get_localtime’:
hello_5a6b.xs:16:27: error: ‘name’ undeclared (first use in this function)
     printf("Hello %s!\n", name);
                           ^
hello_5a6b.xs:16:27: note: each undeclared identifier is reported only once for each function it appears in
Makefile:329: recipe for target 'hello_5a6b.o' failed
make: *** [hello_5a6b.o] Error 1
