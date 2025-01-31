
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, topic-tools }:
buildRosPackage {
  pname = "ros-melodic-rosthrottle";
  version = "1.2.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosthrottle-release";
    rev = "e2f318e0169c36a5f5e8f46b17c6486f31a50b9b";
    owner = "UTNuclearRoboticsPublic";
    sha256 = "sha256-qwfsUzASoxgCF4v1DF0cLpOWQ3MskZlUyxYoV3Ay9Rs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS Python package for throttling ROS topics programatically in Python. Sits on top of the 
        ros_comm topic_tools throttle utility.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
