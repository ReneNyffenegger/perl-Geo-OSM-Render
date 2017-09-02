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

=head1 METHODS
=cut

sub new { #_{
#_{ POD

=head2 new

    my $osm_renderer_svg = Geo::OSM::Render::SVG->new(
      $max_width_height
      $lat_min, $lon_min,
      $lat_max, $lon_max,
      $cp_lat_to_y,
      $cp_lon_to_x
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
  my $cp_lat_lon_2_y_x = shift;

  $self->{max_width_height} = $max_width_height;
  $self->{lat_min         } = $lat_min         ;
  $self->{lon_min         } = $lon_min         ;
  $self->{lat_max         } = $lat_max         ;
  $self->{lon_max         } = $lon_max         ;
  $self->{cp_lat_lon_2_y_x} = $cp_lat_lon_2_y_x;

  return $self;

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
