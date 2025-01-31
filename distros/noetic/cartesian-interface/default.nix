
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, hardware-interface, roscpp, rosunit }:
buildRosPackage {
  pname = "ros-noetic-cartesian-interface";
  version = "0.1.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "Universal_Robots_ROS_controllers_cartesian-release";
    rev = "dc444ba26e6a495bd4a505f41c5b7b1e98fedae5";
    owner = "UniversalRobots";
    sha256 = "sha256-VkxVF/nJmrMeNzLiErhvriN6kgiYZPmJj0U2RzYfsrQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ geometry-msgs hardware-interface roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Defines a hardware interface to send Cartesian commands to a robot hardware and read
    Cartesian states.'';
    license = with lib.licenses; [ asl20 ];
  };
}
