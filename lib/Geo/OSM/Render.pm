# Encoding and name #_{

=encoding utf8
=head1 NAME

Geo::OSM::Render - Render OpenStreetMap data encaspulated via L<Geo::OSM::Primitive>, possibly stored in a L<Geo::OSM::DBI> database.

=cut
package Geo::OSM::Render;
#_}
#_{ use …
use warnings;
use strict;

use utf8;
use Carp;

#_}
our $VERSION = 0.01;
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

    new();


=cut

#_}

  my $class = shift;

  my $self = {};
  bless $self, $class;

  croak "Wrong class $class" unless $self->isa('Geo::OSM::Render');

  return $self;

} #_}

#_}
#_{ POD: Copyright

=head1 Copyright
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
