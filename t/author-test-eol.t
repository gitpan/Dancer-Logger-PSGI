
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;
use Test::More;
use Test::Requires qw( Test::EOL );

all_perl_files_ok({ trailing_whitespace => 1 });
