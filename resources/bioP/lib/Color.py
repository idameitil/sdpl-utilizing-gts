''' package Color.py with translated methods in RGB4.pm and Colorscale.pm originally
    part of the eFam stack - GPGI '''

morecolors = [
        'F2460C',
        '6EAE83',
        'BC9EF9',
        '3D3D8E',
        '653D8E',
        '8E8E3D',
        '0CF2B8',
        'F9BC9E',
        'F99EDB',
        '7F0CF2',
        '0CF246',
        'B80CF2',
        '46F20C',
        'F20CB8',
        'F20C0C',
        '9EF9F9',
        'F2F20C',
        '0C46F2',
        '9EBCF9',
        '668E3D',
        '8E3D66',
        '9EF9DB',
        'B8F20C',
        '3D8E8E',
        'BCF99E',
        '9E9EF9',
        'F2B80C',
        'F99EBC',
        'F20C7F',
        '8E663D',
        'DBF99E',
        '460CF2',
        'F9F99E',
        '9EF99E',
        '8E3D8E',
        '3D8E66',
        'F99E9E',
        '0CF27F',
        'F99EF9',
        'F20C46',
        '9EDBF9',
        '0C7FF2',
        '0CB8F2',
        'F9DB9E',
        '0C0CF2',
        'F20CF2',
        '0CF2F2',
        '7FF20C',
        '3D8E3D',
        '0CF20C',
        '3D658E',
        '8E3D3D',
        'DB9EF9',
        'F27F0C', ]

'''
use Tools::Color::Colorscale;
sub assign_palecolors {
    my ($colors, $pale) = @_; # expecting a number from 0.0 to 1.0
    print STDERR "Assigning Pale colors '$pale'\n";
    foreach my $color (@$colors) {
        my $colorscale = Tools::Color::Colorscale->new({ range => "$color-FFFFFF", count => 30, min => 0.0, max => 1.0, });
        my $hex = $colorscale->hex($pale);
        $hex =~ s/^#//;
        push @$palecolors, $hex;
    }
    return $palecolors;
}
'''

def nextcolor(used=[]) :
    colors = morecolors
    for c in colors :
        if c not in used :
            used.append(c)
            return c
    raise Exception("Ran out of colors. Used {}".format(len(colors)))

'''
PERL package RGB4.py developed by GPGI for Efam display color manipulations, slowly converted to python 
package Tools::Color::RGB4;
use strict;
use warnings;
use Math::Trig;
use Data::Dumper;

my @colordef = (
    { name => 'White',                hex => 'FFFFFF', },
    { name => 'Yellow',               hex => 'FFFF00', },
    { name => 'Orange',               hex => 'FF7F00', },
    { name => 'Orange sherbet',       hex => 'FFC48C', },
    { name => 'Magenta',              hex => 'FF00FF', },
    { name => 'Red',                  hex => 'FF0000', },
    { name => 'Flesh',                hex => 'F5CCB0', },
    { name => 'New Tan',              hex => 'EBC79E', },
    { name => 'Goldenrod',            hex => 'DBDB70', },
    { name => 'Tan',                  hex => 'DB9370', },
    { name => 'Orchid',               hex => 'DB70DB', },
    { name => 'Quartz',               hex => 'D9D9F3', },
    { name => 'Old Gold',             hex => 'CFB53B', },
    { name => 'Gold',                 hex => 'CD7F32', },
    { name => 'Violet Red',           hex => 'CC3299', },
    { name => 'Grey',                 hex => 'C0C0C0', },
    { name => 'Copper',               hex => 'B87333', },
    { name => 'Brass',                hex => 'B5A642', },
    { name => 'Turquoise',            hex => 'ADEAEA', },
    { name => 'Khaki',                hex => '9F9F5F', },
    { name => 'Yellow Green',         hex => '99CC32', },
    { name => 'Dark Orchid',          hex => '9932CD', },
    { name => 'Sienna',               hex => '8E6B23', },
    { name => 'Maroon',               hex => '8E236B', },
    { name => 'Firebrick',            hex => '8E2323', },
    { name => 'Scarlet',              hex => '8C1717', },
    { name => 'Dark Purple',          hex => '871F78', },
    { name => 'Dark Wood',            hex => '855E42', },
    { name => 'Aquamarine',           hex => '70DB93', },
    { name => 'Semi-Sweet Chocolate', hex => '6B4226', },
    { name => 'Cadet Blue',           hex => '5F9F9F', },
    { name => 'Very Dark Brown',      hex => '5C4033', },
    { name => 'Rich Blue',            hex => '5959AB', },
    { name => 'Dim Grey',             hex => '545454', },
    { name => 'Green Copper',         hex => '527F76', },
    { name => 'Violet',               hex => '4F2F4F', },
    { name => 'Summer Sky',           hex => '38B0DE', },
    { name => 'Dark Green',           hex => '2F4F2F', },
    { name => 'Midnight Blue',        hex => '2F2F4F', },
    { name => 'Sea Green',            hex => '238E68', },
    { name => 'Forest Green',         hex => '238E23', },
    { name => 'Steel Blue',           hex => '236B8E', },
    { name => 'Charcoal',             hex => '222222', },
    { name => 'Cyan',                 hex => '00FFFF', },
    { name => 'Spring Green',         hex => '00FF7F', },
    { name => 'Green',                hex => '00FF00', },
    { name => 'Slate Blue',           hex => '007FFF', },
    { name => 'Blue',                 hex => '0000FF', },
    { name => 'Black',                hex => '000000', },

);

=pod

This can be used in a script as

use strict;
use RGB4;
my @rgb_data = (255, 255, 255);
my $hex_data = 'FFFFFF';

my $obj1 = RGB4->new(rgb => \@rgb_data);
my $hex = $obj1->rgb2hex();
print "The hexadecimal equivalent is $hex\n";

my $obj2 = RGB4->new(hex => $hex_data);
my $rgb = $obj2->hex2rgb($hex);
print "The rgb equivalent is @$rgb\n";

=cut

sub new {
    my ( $class, %args ) = @_;
    my $self = {
        name  => $args{name},
        hex   => $args{hex},
        rgb   => $args{rgb},
        hsv   => $args{hsv},
        yiq   => $args{yiq},
        color => $args{color},
    };
    bless $self, $class;
    return $self;
}

sub hex {
    my $self = shift;
    return $self->{hex} if ( defined $self->{hex} );
    return undef;
}

sub rgb2hex {
    my $self = shift;
    return $self->{hex} if defined $self->{hex};
    my $rgb = $self->{rgb} or die "No rgb data available";
    my $hex = sprintf( "%02X%02X%02X", $rgb->[0], $rgb->[1], $rgb->[2] );
    $self->{hex} = $hex;
    return $hex;
}

sub hex2rgb {
    my $self = shift;
    return $self->{rgb} if defined $self->{rgb};
    my $hex = $self->{hex} or die "No hex data available";
    my @rgb = map { CORE::hex($_) } unpack 'a2a2a2', $hex;
    $self->{rgb} = \@rgb;
    return \@rgb;
}

# return black 000000 or white ffffff based on best contrast to background color
sub hexbg2fg {
    my $self = shift;
    my $rgb = $self->hex2rgb();
    my $y = 0.2126 * $$rgb[0] / 256 + 0.7152 * $$rgb[1] / 256 + 0.0722 * $$rgb[2] / 256;
    return ($y > 0.5 ? "000000" : "ffffff");
}

sub name2hex {
    my ($self) = @_;
    return $self->{hex} if defined $self->{hex};
    return undef if ( !defined $self->{name} );
    my ($hex) = map( { $_->{hex} } grep( { lc( $_->{name} ) eq lc( $self->{name} ) } @colordef ) );
    $self->{hex} = $hex;
    return $hex;
}

sub name2rgb {
    my ($self) = @_;
    return $self->{rgb}     if defined $self->{rgb};
    return $self->hex2rgb() if defined $self->{hex};
    return undef            if ( !defined $self->{name} );
    my ($hex) = map( { $_->{hex} } grep( { lc( $_->{name} ) eq lc( $self->{name} ) } @colordef ) );
    $self->{hex} = $hex;
    return $self->hex2rgb();
}

# try to discover name or hex to rgb
sub color2hex {
    my ($self) = @_;
    die("color not defined") if ( !defined $self->{color} );
    if ( uc( $self->{color} ) =~ m/^[#]?([0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F])$/ ) {
        $self->{hex} = $1;
        return $self->{hex};
    } elsif ( scalar( grep( { lc( $_->{name} ) eq lc( $self->{color} ) } @colordef ) ) > 0 ) {
        $self->{name} = $self->{color};
        return $self->name2hex();
    }
    warn( "Color not recognized " . $self->{color} );
    return "000000";
}

# try to discover name or hex to rgb
sub color2rgb {
    my ($self) = @_;
    die("color not defined") if ( !defined $self->{color} );
    if ( uc( $self->{color} ) =~ m/^[#]?([0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F])$/ ) {
        $self->{hex} = $1;
        return $self->hex2rgb();
    } elsif ( scalar( grep( { lc( $_->{name} ) eq lc( $self->{color} ) } @colordef ) ) > 0 ) {
        $self->{name} = $self->{color};
        return $self->name2rgb();
    }
    warn( "Color not recognized " . $self->{color} );
    return [ ( 0, 0, 0 ) ];
}

# Demonstrate some of the color conversions, color sorting, etc
sub demo {
    my ($self) = @_;
    my @colors = split( /,/, "#00CBFF,#FFB6C1,#FF00FF,#FF0000,#CCFF00,#BBBBBB,#00FF00,#EBF651" );
    my %name;
    $name{"#FF00FF"} = "magenta";
    $name{"#FF0000"} = "red";
    $name{"#00FF00"} = "green";
    $name{"#CCFF00"} = "nzgreen";
    $name{"#FFB6C1"} = "pink";
    $name{"#BBBBBB"} = "grey";
    $name{"#EBF651"} = "banana";
    $name{"#00CBFF"} = "blueberry";

    print "COLORS "
      . join(
        "\n\n",
        map( {
                    "name   : "
                  . $name{$_} . "\n"
                  . "hex    : "
                  . $_ . "\n"
                  . "rgb    : "
                  . join( ", ", @{ _hex2rgb($_) } ) . "\n"
                  . "hsv    : "
                  . join( ", ", @{ _hex2hsv($_) } ) . "\n"
                  . "yiq    : "
                  . join( ", ", @{ _hex2yiq($_) } )
            } @colors )
      ) . "\n";

    print "COLORS before sort: " . join( " ", @colors ) . "\n";
    print "COLORS before sort: " . join( " ", map( { $name{$_} } @colors ) ) . "\n";
    @colors = sort _colorsort @colors;
    print "COLORS after  sort: " . join( " ", @colors ) . "\n";
    print "COLORS after  sort: " . join( " ", map( { $name{$_} } @colors ) ) . "\n";
}

sub _hex2rgb {
    my ($self, $hex) = @_;
    $hex =~ s/^#//;
    return [ map( { CORE::hex($_) } unpack 'a2a2a2', $hex ) ];
}

sub _rgb2hex {
    my ($self, $rgb) = @_;
    return sprintf( "%02X%02X%02X", $rgb->[0], $rgb->[1], $rgb->[2] );
}

sub _hex2hsv {
    my ($self, $hex) = @_;
    $hex =~ s/^#//;
    return $self->_rgb2hsv( [ map( { CORE::hex($_) } unpack 'a2a2a2', $hex ) ] );
}

sub _rgb2yiq {
    my ($self, $rgb) = @_;
    $rgb->[0] /= 256.0;
    $rgb->[1] /= 256.0;
    $rgb->[2] /= 256.0;
    my $y     = 0.299    * $rgb->[0] + 0.587    * $rgb->[1] + 0.114    * $rgb->[2];
    my $i     = 0.595716 * $rgb->[0] - 0.274453 * $rgb->[1] - 0.321263 * $rgb->[2];
    my $q     = 0.211456 * $rgb->[0] - 0.522591 * $rgb->[1] + 0.311135 * $rgb->[2];
    return [ ( $y, $i, $q ) ];
}

# Y in [0,1], I in [-0.5957, +0.5957], Q in [-0.5226, +0.5226]
sub _yiq2rgb {
    my ($self, $yiq) = @_;
    my $r     = $yiq->[0] + 0.9563 * $yiq->[1] + 0.6210 * $yiq->[2];
    my $g     = $yiq->[0] - 0.2721 * $yiq->[1] - 0.6474 * $yiq->[2];
    my $b     = $yiq->[0] - 1.1070 * $yiq->[1] + 1.7046 * $yiq->[2];
    $r *= 256;
    $g *= 256;
    $b *= 256;
    #$r -= 256 if $r > 256;
    #$g -= 256 if $g > 256;
    #$b -= 256 if $b > 256;
    return [ ( int($r), int($g), int($b) ) ];
}

sub _hex2yiq {
    my ($hex) = @_;
    $hex =~ s/^#//;
    return _rgb2yiq( [ map( { CORE::hex($_) } unpack 'a2a2a2', $hex ) ] );
}

sub _rgb2hsv {
    my ($rgb) = @_;
    $rgb->[0] /= 255;
    $rgb->[1] /= 255;
    $rgb->[2] /= 255;    # Scale to unity.

    my $minval = $rgb->[0];
    $minval = $rgb->[1] if ( $rgb->[1] < $minval );
    $minval = $rgb->[2] if ( $rgb->[2] < $minval );

    my $maxval = $rgb->[0];
    $maxval = $rgb->[1] if ( $rgb->[1] > $maxval );
    $maxval = $rgb->[2] if ( $rgb->[2] > $maxval );

    my $delta = $maxval - $minval;

    my ( $h, $s, $v ) = ( 0, 0, $maxval );
    if ( $delta > 0 ) {
        $s = $delta / $maxval;
        my $del_R = ( ( ( $maxval - $rgb->[0] ) / 6 ) + ( $delta / 2 ) ) / $delta;
        my $del_G = ( ( ( $maxval - $rgb->[1] ) / 6 ) + ( $delta / 2 ) ) / $delta;
        my $del_B = ( ( ( $maxval - $rgb->[2] ) / 6 ) + ( $delta / 2 ) ) / $delta;

        if    ( $rgb->[0] == $maxval ) { $h = $del_B - $del_G; }
        elsif ( $rgb->[1] == $maxval ) { $h = ( 1 / 3 ) + $del_R - $del_B; }
        elsif ( $rgb->[2] == $maxval ) { $h = ( 2 / 3 ) + $del_G - $del_R; }

        if ( $h < 0 ) { $h += 1; }
        if ( $h > 1 ) { $h -= 1; }
    }
    $h = int( $h * 360 + 0.5 );
    $s = int( $s * 100 + 0.5 );
    $v = int( $v * 100 + 0.5 );
    return [ ( $h, $s, $v ) ];
}

# convert a 'hex' color into an 'angle' using the IQ components of YIQ color space, from 0 to 360 degrees
sub _vang {
    my ($v) = @_;
    my $ang = rad2deg( atan2( $v->[2], $v->[1] ) );
    $ang += 360 if ( $ang <= 0 );
    return $ang;
}

# convert Y, theta (360) to YIQ
sub _yang2yiq {
    my ($self, $y, $ang) = @_;
    $ang *= (3.141592654 / 180.0);
    my $I = 0.5957; # I
    my $Q = 0.5226; # Q ?
    my $i = $I * cos( $ang );
    my $q = $Q * sin( $ang );
    $i = 0.0 if ( sqrt($i * $i) < 1e-6);
    $q = 0.0 if ( sqrt($q * $q) < 1e-6);
    return [ ( $y, $i, $q ) ];
}

sub _yang2rgb {
    my ($self, $y, $ang) = @_;
    my $yiq = $self->_yang2yiq($y, $ang);
    return $self->_yiq2rgb($yiq);
}

sub _yang2hex {
    my ($self, $y, $ang) = @_;
    my $rgb = $self->_yang2rgb($y, $ang);
    return $self->_rgb2hex($rgb);
}

sub _colang {
    my ($hex) = @_;
    return _vang( _hex2yiq($hex) );
}

sub _colorsort {
    my $ang = _colang($a);
    my $bng = _colang($b);
    return $ang <=> $bng;
}


=pod

    Assign the next non-used color in order from a pre-determined list, until they are used, then assign from the list randomly.
=cut

my $somecolors = [qw/
        8DD3C7
        BEBADA
        FB8072
        80B1D3
        FDB462
        B3DE69
        FCCDE5
        BC80BD
        CCEBC5
        FFED6F
        993399
        CC3333
        00CC66
        6600FF
        FFCC00
        33CC33
        3399CC
        0099FF
        FF0033
        FF66CC
        66CC99
        33CC00
        3366CC
        660000
        00CCCC
        009933
        66FF00
        336600
        00CC00
        FF99CC
        66CC66
        FF6699
        6600CC
      /];

my $morecolors = [qw/
        F2460C
        9EF9BC
        BC9EF9
        3D3D8E
        653D8E
        8E8E3D
        0CF2B8
        F9BC9E
        F99EDB
        7F0CF2
        0CF246
        B80CF2
        46F20C
        F20CB8
        F20C0C
        9EF9F9
        F2F20C
        0C46F2
        9EBCF9
        668E3D
        8E3D66
        9EF9DB
        B8F20C
        3D8E8E
        BCF99E
        9E9EF9
        F2B80C
        F99EBC
        F20C7F
        8E663D
        DBF99E
        460CF2
        F9F99E
        9EF99E
        8E3D8E
        3D8E66
        F99E9E
        0CF27F
        F99EF9
        F20C46
        9EDBF9
        0C7FF2
        0CB8F2
        F9DB9E
        0C0CF2
        F20CF2
        0CF2F2
        7FF20C
        3D8E3D
        0CF20C
        3D658E
        8E3D3D
        DB9EF9
        F27F0C
        /];

my $palecolors;

use Tools::Color::Colorscale;
sub assign_palecolors {
    my ($colors, $pale) = @_; # expecting a number from 0.0 to 1.0
    print STDERR "Assigning Pale colors '$pale'\n";
    foreach my $color (@$colors) {
        my $colorscale = Tools::Color::Colorscale->new({ range => "$color-FFFFFF", count => 30, min => 0.0, max => 1.0, });
        my $hex = $colorscale->hex($pale);
        $hex =~ s/^#//;
        push @$palecolors, $hex;
    }
    return $palecolors;
}

sub nextcolor {
    my ($self, $param) = @_;
    my $used = $param->{used};

    # Choose palette
    my $colors = $morecolors;
    if ( defined $param->{mycolors} ) {
        $colors = $param->{mycolors};
    }
    elsif ( defined $param->{some} ) {
        $colors = $somecolors;
    }

    # Choose saturation (pale value from 0.0 to 1.0);
    if ( defined $param->{pale} ) {
        $palecolors //= assign_palecolors($colors, $param->{pale});
        $colors = $palecolors;
    }

    # Pick the next one
    foreach my $color (@$colors) {
        return $color if ( scalar( grep( { $_ eq $color } values %$used ) ) == 0 );
    }

    warn("no unused colors left, returning random");
    return $$colors[ rand( scalar(@$colors) ) ];
}

=head1 AUTHOR

Garry P. Gippert <gpgi@novozymes.com>

and open sources...

=cut

1;
'''
