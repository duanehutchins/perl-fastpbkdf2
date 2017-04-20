# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Crypt-OpenSSL-FASTPBKDF2.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 9;
BEGIN { use_ok('Crypt::OpenSSL::FASTPBKDF2') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

ok(Crypt::OpenSSL::FASTPBKDF2::is_even(0), "is_even 2");
ok(!Crypt::OpenSSL::FASTPBKDF2::is_even(1), "is_even 3");
ok(Crypt::OpenSSL::FASTPBKDF2::is_even(2), "is_even 4");

my $i;
$i = -1.5; Crypt::OpenSSL::FASTPBKDF2::round($i); ok($i == -2.0, "round 5");
$i = -1.1; Crypt::OpenSSL::FASTPBKDF2::round($i); ok($i == -1.0, "round 6");
$i = 0.0; Crypt::OpenSSL::FASTPBKDF2::round($i); ok($i == 0.0, "round 7");
$i = 0.5; Crypt::OpenSSL::FASTPBKDF2::round($i); ok($i == 1.0, "round 8");
$i = 1.2; Crypt::OpenSSL::FASTPBKDF2::round($i); ok($i == 1.0, "round 9");