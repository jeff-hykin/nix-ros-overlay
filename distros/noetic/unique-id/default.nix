
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, rospy, rosunit, uuid-msgs }:
buildRosPackage {
  pname = "ros-noetic-unique-id";
  version = "1.0.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "unique_identifier-release";
    rev = "07204044b560f6ad6cc8de02a6325d0e30652962";
    owner = "ros-geographic-info";
    sha256 = "sha256-Utf63NtbxEw1gmgIlpLsrswjQvw973ZfBGJ2cbCPYd8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ roscpp rospy uuid-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS Python and C++ interfaces for universally unique identifiers.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
