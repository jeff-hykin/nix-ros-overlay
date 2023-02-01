
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, rostest }:
buildRosPackage {
  pname = "ros-melodic-parameter-assertions";
  version = "0.1.0-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "RoboJackets";
        repo = "rj-ros-common-release";
        rev = "release/melodic/parameter_assertions/0.1.0-1";
        sha256 = "sha256-C1nSLGcKuH06sWsi0lfdDJHzWYO7yxyUOOBGmXc61WY=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A library for ROS parameter assertions'';
    license = with lib.licenses; [ mit ];
  };
}
