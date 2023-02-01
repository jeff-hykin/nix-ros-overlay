
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros }:
buildRosPackage {
  pname = "ros-melodic-yosemite-valley";
  version = "0.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uav_testing-release";
    rev = "5978cfbadc9380dca59351800b96ca20ff1c5960";
    owner = "ros-gbp";
    sha256 = "sha256-RG6ylp+s5JBvWw4UQsgWwMDbvuUd7VVkXYU39hFEwnA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The yosemite_valley package'';
    license = with lib.licenses; [ asl20 ];
  };
}
