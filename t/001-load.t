use Test::More tests => 3;

use Geo::OSM::Render;
use Geo::OSM::Render::Projection::Ident;
use Geo::OSM::Render::SVG;

my $osm_proj_id    = Geo::OSM::Render::Projection::Ident->new();
my $osm_render     = Geo::OSM::Render     ->new();
my $osm_render_svg = Geo::OSM::Render::SVG->new(
 't/001-load.svg',
  1,
  1, 1,
  2, 2,
  sub {return @_ },
);

isa_ok($osm_render    , 'Geo::OSM::Render'                   );
isa_ok($osm_proj_id   , 'Geo::OSM::Render::Projection::Ident');
isa_ok($osm_render_svg, 'Geo::OSM::Render::SVG'              );
