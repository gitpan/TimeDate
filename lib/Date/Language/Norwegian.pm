##
## Norwegian tables
##

package Date::Language::Norwegian;

use Date::Language ();
use vars qw(@ISA @DoW @DoWs @MoY @MoYs @AMPM @Dsuf %MoY %DoW);
@ISA = qw(Date::Language);

@MoY  = qw(Januar Februar Mars April Mai Juni
	   Juli August September Oktober November Desember);
@MoYs = qw(Jan Feb Mar Apr Mai Jun Jul Aug Sep Okt Nov Des);
@DoW  = qw(S�ndag Mandag Tirsdag Onsdag Torsdag Fredag L�rdag S�ndag);
@DoWs = qw(S�n Man Tir Ons Tor Fre L�r S�n);

@AMPM =   @{Date::Language::English::AMPM};
@Dsuf =   @{Date::Language::English::Dsuf};

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
