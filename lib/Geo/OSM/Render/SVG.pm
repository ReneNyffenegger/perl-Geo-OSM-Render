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

    my $osm_renderer_svg = Geo::OSM::Render::SVG->new(
      $max_width_height
      $lat_min, $lon_min,
      $lat_max, $lon_max,
      $cp_lat_lon_2_x_y
    );

=cut

#_}

  my $class = shift;

  my $self = $class->SUPER::new();

  croak "Wrong class $class" unless $self->isa('Geo::OSM::Render::SVG');

  my $max_width_height = shift;
  my $lat_min          = shift;
  my $lon_min          = shift;
  my $lat_max          = shift;
  my $lon_max          = shift;
  my $cp_lat_lon_2_x_y = shift;

  croak "cp_lat_lon_2_x_y must be a code ref, but is " . ref($cp_lat_lon_2_x_y) unless ref($cp_lat_lon_2_x_y) eq 'CODE';

  $self->{max_width_height} = $max_width_height;
  $self->{lat_min         } = $lat_min         ;
  $self->{lon_min         } = $lon_min         ;
  $self->{lat_max         } = $lat_max         ;
  $self->{lon_max         } = $lon_max         ;
  $self->{cp_lat_lon_2_x_y} = $cp_lat_lon_2_x_y;

  $self->_determine_width_height();

  return $self;

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