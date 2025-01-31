
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, map-laser }:
buildRosPackage {
  pname = "ros-melodic-laser-filtering";
  version = "0.0.4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "laser_filtering_release";
    rev = "e0fbf3fcf03b16cc882463a82b090eb5d022928e";
    owner = "wu-robotics";
    sha256 = "sha256-JbElAsvmHdt/aNqsThNNdR2RYuVEoAwwKlnIMR3zTGo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ map-laser ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS Libraries for filtering specific kinds of laser scans'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
