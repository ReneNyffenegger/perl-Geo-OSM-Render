use Test::More tests => 4;

use Geo::OSM::Render;
use Geo::OSM::Render::Projection;
use Geo::OSM::Render::Projection::Ident;
use Geo::OSM::Render::SVG;
use Geo::OSM::Render::Viewport;
use Geo::OSM::Render::Viewport::UnClipped;

my $osm_proj_id    = Geo::OSM::Render::Projection::Ident->new();
my $osm_render     = Geo::OSM::Render     ->new();
my $osm_render_svg = Geo::OSM::Render::SVG->new(
 't/001-load.svg',
  1,
  1, 1,
  2, 2,
  sub {return @_ },
);
my $osm_vp         = Geo::OSM::Render::Viewport::UnClipped->new();

isa_ok($osm_render    , 'Geo::OSM::Render'                     );
isa_ok($osm_proj_id   , 'Geo::OSM::Render::Projection::Ident'  );
isa_ok($osm_render_svg, 'Geo::OSM::Render::SVG'                );
isa_ok($osm_vp        , 'Geo::OSM::Render::Viewport::UnClipped');
