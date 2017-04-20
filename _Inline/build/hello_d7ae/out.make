Running Mkbootstrap for hello_d7ae ()
chmod 644 hello_d7ae.bs
/usr/bin/perl /usr/share/perl/5.20/ExtUtils/xsubpp  -typemap "/usr/share/perl/5.20/ExtUtils/typemap" -typemap "/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2/typemap"   hello_d7ae.xs > hello_d7ae.xsc && mv hello_d7ae.xsc hello_d7ae.c
cc -c  -I"/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2" -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fwrapv -fno-strict-aliasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g   -DVERSION=\"0.00\" -DXS_VERSION=\"0.00\" -fPIC "-I/usr/lib/x86_64-linux-gnu/perl/5.20/CORE"   hello_d7ae.c
In file included from /usr/lib/x86_64-linux-gnu/perl/5.20/CORE/perl.h:3337:0,
                 from hello_d7ae.xs:2:
hello_d7ae.xs: In function ‘get_localtime’:
hello_d7ae.xs:9:38: error: ‘utc’ undeclared (first use in this function)
     const time_t utc_ = (time_t)SvIV(utc);
                                      ^
/usr/lib/x86_64-linux-gnu/perl/5.20/CORE/sv.h:319:22: note: in definition of macro ‘SvFLAGS’
 #define SvFLAGS(sv) (sv)->sv_flags
                      ^
/usr/lib/x86_64-linux-gnu/perl/5.20/CORE/sv.h:1662:19: note: in expansion of macro ‘SvIOK_nog’
 #define SvIV(sv) (SvIOK_nog(sv) ? SvIVX(sv) : sv_2iv(sv))
                   ^
hello_d7ae.xs:9:33: note: in expansion of macro ‘SvIV’
     const time_t utc_ = (time_t)SvIV(utc);
                                 ^
hello_d7ae.xs:9:38: note: each undeclared identifier is reported only once for each function it appears in
     const time_t utc_ = (time_t)SvIV(utc);
                                      ^
/usr/lib/x86_64-linux-gnu/perl/5.20/CORE/sv.h:319:22: note: in definition of macro ‘SvFLAGS’
 #define SvFLAGS(sv) (sv)->sv_flags
                      ^
/usr/lib/x86_64-linux-gnu/perl/5.20/CORE/sv.h:1662:19: note: in expansion of macro ‘SvIOK_nog’
 #define SvIV(sv) (SvIOK_nog(sv) ? SvIVX(sv) : sv_2iv(sv))
                   ^
hello_d7ae.xs:9:33: note: in expansion of macro ‘SvIV’
     const time_t utc_ = (time_t)SvIV(utc);
                                 ^
Makefile:329: recipe for target 'hello_d7ae.o' failed
make: *** [hello_d7ae.o] Error 1
