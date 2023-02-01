
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, python3Packages, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-ubnt-airos-tools";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ubnt_airos_tools-release";
    rev = "6bd7b26d0af74483f755fa7879a771ecfc7f8dbf";
    owner = "peci1";
    sha256 = "sha256-H+ccLukZAsvAUznsxYrEULJHVeOs5OSQp0+idv1O+v8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime python3Packages.requests rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Ubiquiti AirOS tools for extracting AP information to ROS'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
