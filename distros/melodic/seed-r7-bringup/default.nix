
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, robot-state-publisher, seed-r7-ros-controller, seed-r7-typef-moveit-config }:
buildRosPackage {
  pname = "ros-melodic-seed-r7-bringup";
  version = "0.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "seed_r7_ros_pkg-release";
    rev = "2e78982224a8120e349a79a9d6b413a3e0b033eb";
    owner = "seed-solutions";
    sha256 = "sha256-OZL7jmUgLkQr9TN02kPuyEN7F9shBIiSEU9lmcXMwNo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ controller-manager robot-state-publisher seed-r7-ros-controller seed-r7-typef-moveit-config ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The seed_r7_bringup package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
