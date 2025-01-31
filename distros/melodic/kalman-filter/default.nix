
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roslint, rospy }:
buildRosPackage {
  pname = "ros-melodic-kalman-filter";
  version = "0.2.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "wu_ros_tools";
    rev = "9f2b77c00b2ebda7f8d83bb2c57bd95cf643adea";
    owner = "wu-robotics";
    sha256 = "sha256-/a/1udT+YzGVg8uWGfsGWTOmSG17q+uRCYvws7QJv6Y=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Simple Kalman Filter in Python'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
