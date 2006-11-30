# $Id$

use Test::More tests => 3;

BEGIN { use_ok('DateTime::Fiscal::Retail454') };

my $r454 = DateTime::Fiscal::Retail454->from_r454year( r454year => 2006 );

eval { my $r454start = $r454->_454_start($r454->r454_year); };
ok($@, '_454_start is private');

my $r454_2 = Empty::Retail454->from_r454year( r454year => 2006 );
my $r454_2start = $r454_2->_test_454_start;
isa_ok($r454_2start,'Empty::Retail454',"_454_start worked from Empty::Retail454");

exit;

package Empty::Retail454;
use base qw(DateTime::Fiscal::Retail454);

sub _test_454_start
{
my $self = shift;

  my $tmp = $self->_454_start($self->r454_year);

return($tmp);
}

__END__

