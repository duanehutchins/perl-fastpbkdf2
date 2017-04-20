use ExtUtils::MakeMaker;
my %options = %{
{
  'TYPEMAPS' => [
    '/usr/share/perl/5.20/ExtUtils/typemap',
    '/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2/typemap'
  ],
  'VERSION' => '0.00',
  'INC' => '-I"/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2"',
  'NAME' => 'hello_538c',
  'LIBS' => [
    '-lcrypto -L/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2/fastpbkdf2/fastpbkdf2'
  ]
}
};
WriteMakefile(%options);

# Remove the Makefile dependency. Causes problems on a few systems.
sub MY::makefile { '' }
