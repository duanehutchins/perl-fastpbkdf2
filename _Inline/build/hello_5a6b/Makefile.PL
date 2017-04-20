use ExtUtils::MakeMaker;
my %options = %{
{
  'TYPEMAPS' => [
    '/usr/share/perl/5.20/ExtUtils/typemap',
    '/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2/typemap'
  ],
  'NAME' => 'hello_5a6b',
  'INC' => '-I"/home/drh/public_html/Crypt-OpenSSL-FASTPBKDF2"',
  'VERSION' => '0.00'
}
};
WriteMakefile(%options);

# Remove the Makefile dependency. Causes problems on a few systems.
sub MY::makefile { '' }
