use Test::More tests => 2;

use Geo::OSM::Render;
use Geo::OSM::Render::SVG;

my $osm_render     = Geo::OSM::Render     ->new();
my $osm_render_svg = Geo::OSM::Render::SVG->new(
  1,
  1, 1,
  2, 2,
  sub {return @_ },
);

isa_ok($osm_render    , 'Geo::OSM::Render'     );
isa_ok($osm_render_svg, 'Geo::OSM::Render::SVG');
