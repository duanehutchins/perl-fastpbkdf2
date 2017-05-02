# perl-fastpbkdf2 (Crypt::OpenSSL::FASTPBKDF2)

[![N|Perl](http://www.perlfoundation.org//data/workspaces/perlfoundation/attachments/perl_trademark:20100824100117-0-22465/files/powered_by_perl-135px.png)](http://www.perl.org)

Crypt::OpenSSL::FASTPBKDF2 is the Perl wrapper for PBKDF2 keys derivation function of the OpenSSL library using fastpbkdf2.

PBKDF2 applies a pseudorandom function, such as hash-based message authentication code (HMAC), to the input password or passphrase along with a salt value and repeats the process many times to produce a derived key, which can then be used as a cryptographic key in subsequent operations. The added computational work makes password cracking much more difficult, and is known as key stretching.

Fastpbkdf2 is a fast PBKDF2-HMAC-{SHA1|SHA256|SHA512} implementation in C. It uses OpenSSL's hash functions, but out-performs OpenSSL's own PBKDF2 thanks to various optimisations in the inner loop.

### Dependencies

This module requires these other modules and libraries:

  - XSLoader (Perl module)
  - OpenSSL (C library)

### Installation

This module is not yet on CPAN. To install this module from source, download and extract the files into a new folder. In that folder, type the following:

```sh
$ perl Makefile.PL
$ make
$ make test
$ sudo make install
```

### Usage

```perl
  use Crypt::OpenSSL::FASTPBKDF2 qw/fastpbkdf2_hmac_sha1 fastpbkdf2_hmac_sha256 fastpbkdf2_hmac_sha512/;

  # Initialize parameters for password, salt, number of iterations, and desired output length (in bytes)
  my ($password, $salt, $num_iterations, $output_len) = ('password', 'salt', 100, 32);

  # Initialize buffer array (optional argument)
  my @buffer;

  # Set hash results into scalar variables
  my $hash_sha1 = fastpbkdf2_hmac_sha1($password, $salt, $num_iterations, $output_len, @buffer);        #= 0x8595d7aea0e7c952a35af9a838cc6b393449307cfcc7bd340e7e32ee90115650
  my $hash_sha256 = fastpbkdf2_hmac_sha256($password, $salt, $num_iterations, $output_len, @buffer);    #= 0x07e6997180cf7f12904f04100d405d34888fdf62af6d506a0ecc23b196fe99d8
  my $hash_sha512 = fastpbkdf2_hmac_sha512($password, $salt, $num_iterations, $output_len, @buffer);    #= 0xfef7276b107040a0a713bcbec9fd3e191cc6153249e245a3e1a22087dbe61606

  # Print the contents of the buffer as HEX
  print unpack('H*', join('', @buffer)); # "8595d7aea0e7c952a35af9a838cc6b393449307cfcc7bd340e7e32ee9011565007e6997180cf7f12904f04100d405d34888fdf62af6d506a0ecc23b196fe99d8fef7276b107040a0a713bcbec9fd3e191cc6153249e245a3e1a22087dbe61606"
```

Copyright
----

Copyright (C) 2017 Duane Hutchins - [Univeral Printing Company, LLC] [universal-printing-company]

License
----

[GNU GPLv3] [license]

See Also
----

  - NIST-PBKDF2 [NIST Special Publication 800-132] [Nist]
  - Joseph Birr-Pixton [fastpbkdf2] [fastpbkdf2]

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [fastpbkdf2]: <https://github.com/ctz/fastpbkdf2>
   [Nist]: <http://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-132.pdf>
   [perl]: <http://www.perl.org>
   [license]: <./LICENSE.md>
   [universal-printing-company]: <http://www.universalprintingcompany.com/>
