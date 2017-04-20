use 5.020002;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
		NAME              => 'Crypt::OpenSSL::FASTPBKDF2',
		VERSION_FROM      => 'lib/Crypt/OpenSSL/FASTPBKDF2.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
		PREREQ_PM         => {}, # e.g., Module::Name => 1.1
		ABSTRACT_FROM     => 'lib/Crypt/OpenSSL/FASTPBKDF2.pm', # retrieve abstract from module
		AUTHOR            => 'Duane Hutchins <duanehutchins@hotmail.com>',
		LICENSE           => 'perl',
		#Value must be from legacy list of licenses here
		#http://search.cpan.org/perldoc?Module%3A%3ABuild%3A%3AAPI
		LIBS              => '-lm -lcrypto -L/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2/fastpbkdf2/fastpbkdf2.h', # e.g., '-lm'
		DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
		INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    OBJECT            => '$(O_FILES)', # link all the C files too
    # OBJECT            => 'FASTPBKDF2 fastpbkdf2/fastpbkdf2', # link all the C files too
		MYEXTLIB 					=> 'fastpbkdf2/libfastpbkdf2.so',
		# MYEXTLIB 					=> '',
		# EXTRALIBS => 'fastpbkdf2/libfastpbkdf2$(LIB_EXT)',
		# CCFLAGS 					=> '-fPIC -std=c99',
);

# sub MY::postamble {
# '
# $(MYEXTLIB): fastpbkdf2/Makefile
# 				cd fastpbkdf2 && make
# ';
# }