
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, rospy, rostest, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rr-control-input-manager";
  version = "1.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rr_openrover_stack-release";
    rev = "323e8919825fa6ba600230bde0ce6604e5d5b63f";
    owner = "RoverRobotics-release";
    sha256 = "sha256-N1eAXLT8McUKwIshcogkg1MPGmhOqo27zUgLXGZsR4M=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Filter velocity commands by ensuring that message time stamps do not exceed given timeout thresholds.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
