
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-melodic-abb-rapid-msgs";
  version = "0.5.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "abb_robot_driver_interfaces-release";
    rev = "f538237b6ee436406ad891b6cd46f124ea843275";
    owner = "ros-industrial-release";
    sha256 = "sha256-JEaaBwJgjTm8YdevLdMx5hnzOEVUO5IhemIKHW6eeh4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ message-generation message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides ROS message definitions, representing RAPID data from ABB robot controllers.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
