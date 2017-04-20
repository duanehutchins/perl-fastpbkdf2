use ExtUtils::MakeMaker;
my %options = %{
{
  'VERSION' => '0.00',
  'INC' => '-I"/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2"',
  'NAME' => 'hello_d7ae',
  'TYPEMAPS' => [
    '/usr/share/perl/5.20/ExtUtils/typemap',
    '/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2/typemap'
  ]
}
};
WriteMakefile(%options);

# Remove the Makefile dependency. Causes problems on a few systems.
sub MY::makefile { '' }
