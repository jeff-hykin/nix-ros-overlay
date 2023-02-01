
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen }:
buildRosPackage {
  pname = "ros-melodic-xpp-states";
  version = "1.0.10";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "leggedrobotics";
        repo = "xpp-release";
        rev = "release/melodic/xpp_states/1.0.10-0";
        sha256 = "sha256-6tRWtoNGYmKG79eGQPk28C00gV9Wl7AXN+SxcezJ05U=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Common definitions (positions, velocities, angular angles,
    angular rates) and robot definitions in Cartesian and joint state
    used in the Xpp Motion Framework, as well as conversions to/from
    xpp_msgs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
