# Encoding and name #_{

=encoding utf8
=head1 NAME

Geo::OSM::Render::SVG - Specialization of base class L<Geo::OSM::Render> for rendering SVG.

=cut
package Geo::OSM::Render::SVG;
#_}
#_{ use …
use warnings;
use strict;

use utf8;
use Carp;

use SVG;
use Geo::OSM::Render;

#_}
our $VERSION = 0.01;
our @ISA = qw(Geo::OSM::Render);
#_{ Synopsis

=head1 SYNOPSIS


=cut
#_}
#_{ Overview

=head1 OVERVIEW

…

=cut

#_}
#_{ Methods
#_{ POD
=head1 METHODS
=cut
#_}
sub new { #_{
#_{ POD

=head2 new

    my $proj = Geo::OSM::Render::Projection::CH_LV03->new();
    my $vp   = Geo::OSM::Render::Viewport::Clipped->new(…);

    my $osm_renderer_svg = Geo::OSM::Render::SVG->new(
      $svg_filename,
      $proj,
      $vp
    );

    …

    $osm_renderer_svg->end();

=cut

#_}

  my $class = shift;

  my $self = $class->SUPER::new();

  croak "Wrong class $class" unless $self->isa('Geo::OSM::Render::SVG');

  my $svg_filename     = shift;

  while (@_) {
    if ($_[0] -> isa('Geo::OSM::Render::Viewport::Clipped')) {
      $self->{viewport} = shift;
      next;
    }
    if ($_[0] -> isa('Geo::OSM::Render::Projection')) {
      $self->{projection} = shift;
      next;
    }
    last;
  }

  croak 'Missing viewport' unless $self->{viewport};

# my $max_width_height = shift;
# my $lat_min          = shift;
# my $lon_min          = shift;
# my $lat_max          = shift;
# my $lon_max          = shift;
# my $cp_lat_lon_2_x_y = shift;

# croak "cp_lat_lon_2_x_y must be a code ref, but is " . ref($cp_lat_lon_2_x_y) unless ref($cp_lat_lon_2_x_y) eq 'CODE';

  open ($self->{svg_fh}, '>', $svg_filename) or croak "Could not open $svg_filename";

# $self->{max_width_height} = $max_width_height;
# $self->{lat_min         } = $lat_min         ;
# $self->{lon_min         } = $lon_min         ;
# $self->{lat_max         } = $lat_max         ;
# $self->{lon_max         } = $lon_max         ;
# $self->{cp_lat_lon_2_x_y} = $cp_lat_lon_2_x_y;

# $self->_determine_width_height();

  $self->{svg} = SVG->new(
    width  => $self->{viewport}->map_width (),
    height => $self->{viewport}->map_height()
  ) or croak "Could not start svg";

  return $self;

} #_}
sub end { #_{
#_{ POD

=head2 end

When finished rendering, this method writes the SVG.

=cut
#_}
  my $self = shift;
  my $svg_text = $self->{svg}->xmlify();
  print {$self->{svg_fh}} $svg_text;
  close $self->{svg_fh};

} #_}
sub render { #_{
#_{ POD

=head2 render

See L<Geo::OSM::Render/render>.

=cut
#_}

  my $self      = shift;
  my $primitive = shift;

  $self->SUPER::render($primitive);

  if ($primitive->isa('Geo::OSM::Primitive::Node')) {
    my ($x, $y) = &{$self->{cp_lat_lon_2_x_y}}($primitive->{lat}, $primitive->{lon});
    print "$x, $y\n";
  }

} #_}
sub _determine_width_height { #_{
#_{ POD

=head2 _determine_width_height

This method determines the width and height of the produced SVG so that C<< max($width, $height) >> is equal to C<< $max_width_height >> which was passed in the
L</new> method.

=cut

  my $self = shift;

#_}
  
 (
  $self->{x_min}, $self->{y_min},
  $self->{x_max}, $self->{y_max}
 ) = (
  &{$self->{cp_lat_lon_2_x_y}}($self->{lat_min}, $self->{lon_min}),
  &{$self->{cp_lat_lon_2_x_y}}($self->{lat_max}, $self->{lon_max})
 );

  my $width_  = $self->{x_max}-$self->{x_min};
  my $height_ = $self->{y_max}-$self->{y_min};

  if ($width_ > $height_) {
    $self->{width } = $self->{max_width_height};
    $self->{height} = $self->{max_width_height} / $width_*$height_;
  }
  else {
    $self->{height} = $self->{max_width_height};
    $self->{width } = $self->{max_width_height} / $height_*$width_;
  }

} #_}
sub _x_y_to_svg_x_y { #_{
#_{ POD

=head2 _x_y_to_svg_x_y

    my ($svg_x, $svg_y) = $self->_x_y_to_svg_x_y($x, $y);

This method converts an C<x,y> coordinate pair to svg coordinates. Ideally, the
returned values are greater or equal 0 and smaller or equal to the svg width or
height respectively.

=cut
#_}

  my $self = shift;
  my $x    = shift;
  my $y    = shift;

  my $todo_width  = 1;
  my $todo_height = 1;

# In SVG, the coordinate 0/0 marks the *upper* left corner, so
# for y, we have to make an additional substraction for $y.
  my $x_ =                   ($x - $self->{x_min}) / $todo_width  * $self->{width };
  my $y_ = $self->{height} - ($y - $self->{y_min}) / $todo_height * $self->{height}; 

  return ($x_, $y_);

} #_}
#_}
#_{ POD: Author

=head1 AUTHOR

René Nyffenegger <rene.nyffenegger@adp-gmbh.ch>

=cut

#_}
#_{ POD: Copyright and License

=head1 COPYRIGHT AND LICENSE
Copyright © 2017 René Nyffenegger, Switzerland. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at: L<http://www.perlfoundation.org/artistic_license_2_0>
=cut

#_}
#_{ POD: Source Code

=head1 Source Code

The source code is on L<< github|https://github.com/ReneNyffenegger/perl-Geo-OSM-Render >>. Meaningful pull requests are welcome.

=cut

#_}

'tq84';
