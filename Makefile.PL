use 5.020002;
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
  NAME              => 'Crypt::OpenSSL::FASTPBKDF2',
  VERSION_FROM      => 'lib/Crypt/OpenSSL/FASTPBKDF2.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
  ABSTRACT_FROM     => 'lib/Crypt/OpenSSL/FASTPBKDF2.pm', # retrieve abstract from module
  AUTHOR            => 'Duane Hutchins <duanehutchins@hotmail.com>',
  LICENSE           => 'gpl_3',
  LIBS              => '-lcrypto', # e.g., '-lm'
  DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
  INC               => '-I.', # e.g., '-I. -I/usr/include/other'
  OBJECT            => '$(O_FILES) src/fastpbkdf2.c', # link all the C files too
# MYEXTLIB          => 'src/libfastpbkdf2.so',
  CCFLAGS           => '-std=c99',
  LDDLFLAGS         => '-shared -fstack-protector -fPIC -std=c99 -O3 -g -Wall -Werror -Wextra -pedantic',
  clean             => { FILES => "*.so" },
  PREREQ_PM         => {
    "XSLoader" => 0,
    "Exporter" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  TEST_REQUIRES     => {
    "Test::More" => 0,
    "constant" => 0,
    "strict" => 0,
    "warnings" => 0
  },
);
