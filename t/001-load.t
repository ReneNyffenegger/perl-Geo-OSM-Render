use Test::More tests => 1;

use Geo::OSM::Render;
my $osm_render = Geo::OSM::Render->new();

isa_ok($osm_render, 'Geo::OSM::Render');
