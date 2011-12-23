
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Dancer" => 0,
    "English" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "Module::Build" => "0.3601",
    "Plack::Builder" => 0,
    "Plack::Loader" => 0,
    "Test::More" => 0,
    "Test::Requires" => 0,
    "Test::TCP" => 0,
    "perl" => "5.006"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "PSGI Log handler for Dancer",
  "dist_author" => [
    "franck cuny <franck\@lumberjaph.net>"
  ],
  "dist_name" => "Dancer-Logger-PSGI",
  "dist_version" => "0.020_001",
  "license" => "perl",
  "module_name" => "Dancer::Logger::PSGI",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Dancer::Logger::Abstract" => 0,
    "Dancer::SharedData" => 0,
    "base" => 0,
    "perl" => "5.006",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
