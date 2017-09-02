use Test::More tests => 2;

use Geo::OSM::Render::SVG;

use Geo::Coordinates::Converter::LV03 qw(lat_lng_2_y_x);

my $osm_renderer_svg = Geo::OSM::Render::SVG->new(
   750,

                 # ------------  According to https://en.wikipedia.org/wiki/List_of_extreme_points_of_Switzerland:
   45.817995 ,   # Southernmost  45.818031 /  9.016483 - 722640 /  75275
    5.9559113,   # Westernmost   46.132242 /  5.956303 - 485441 / 110057
   47.8084648,   # Northernmost  47.808264 /  8.567897 - 684592 / 295912
   10.4922941,   # Eeastermost   46.612778 / 10.491944 - 833841 / 166942

  \&lat_lng_2_y_x 

);

# printf "%9.3f %9.3f %9.3f %9.3f\n", $osm_renderer_svg->{x_min}, $osm_renderer_svg->{y_min}, $osm_renderer_svg->{x_max}, $osm_renderer_svg->{y_max};

is(       $osm_renderer_svg->{width }           , 750, 'calculated width' );
is( int ( $osm_renderer_svg->{height} / 10) * 10, 480, 'calculated height');
