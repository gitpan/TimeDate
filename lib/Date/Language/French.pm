##
## French tables, contributed by Emmanuel Bataille (bem@residents.frmug.org)
##

package Date::Language::French;

use Date::Language ();
use vars qw(@ISA @DoW @DoWs @MoY @MoYs @AMPM @Dsuf %MoY %DoW);
@ISA = qw(Date::Language);

@DoW = qw(dimanche lundi mardi mercredi vendredi samedi);
@MoY = qw(janvier f�vrier mars avril mai juin 
          juillet ao�t septembre octobre novembre d�cembre);
@DoWs = map { substr($_,0,3) } @DoW;
@MoYs = map { substr($_,0,4) } @MoY; # 4 insteed of 3 'cause [juin] [juil]let
@AMPM = qw(AM PM);

@Dsuf = (qw(er e e e e e e e e e)) x 3;
# Not need..
# @Dsuf[11,12,13] = qw(th th th);
# @Dsuf[30,31] = qw(th st);

@MoY{@MoY}  = (0 .. scalar(@MoY));
@MoY{@MoYs} = (0 .. scalar(@MoYs));
@DoW{@DoW}  = (0 .. scalar(@DoW));
@DoW{@DoWs} = (0 .. scalar(@DoWs));

# Formatting routines

sub format_a { $DoWs[$_[0]->[6]] }
sub format_A { $DoW[$_[0]->[6]] }
sub format_b { $MoYs[$_[0]->[4]] }
sub format_B { $MoY[$_[0]->[4]] }
sub format_h { $MoYs[$_[0]->[4]] }
sub format_p { $_[0]->[2] >= 12 ?  $AMPM[1] : $AMPM[0] }

1;
