use strict;
use warnings;
use Test::More tests => 1;

use Geo::OSM::Primitive::Node;

my $node = Geo::OSM::Primitive::Node->new( 42, 4, 2);

use Geo::OSM::Render::SVG;

my $osm_renderer_svg = Geo::OSM::Render::SVG->new(
  't/003-svg-render-nodes.svg',
   800,
    -1,  # Southernmost
    -2,  # Westernmost
     5,  # Northernmost
     6,  # Eeastermost
   sub {return ($_[1], $_[0]);}
);

$osm_renderer_svg->render($node);
$osm_renderer_svg->end;

ok(1);
