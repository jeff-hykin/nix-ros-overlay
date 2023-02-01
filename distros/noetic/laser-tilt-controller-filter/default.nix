
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, filters, pluginlib, pr2-msgs, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-laser-tilt-controller-filter";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_navigation-release";
    rev = "6c3f1c837248d83a82d09c679b5a763b7b92f23b";
    owner = "pr2-gbp";
    sha256 = "sha256-dcZG85aSNpS2XB8juhkrEYqA7cX5xmWSZSo+EwwXVj8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ filters pluginlib pr2-msgs roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''laser_tilt_controller_filter'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
