
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros-pkgs, robot, rqt-common-plugins, rqt-robot-plugins, stage-ros }:
buildRosPackage {
  pname = "ros-melodic-simulators";
  version = "1.4.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "metapackages-release";
    rev = "9818c8054635c7c384de3b01e22c2ad867c63e5e";
    owner = "ros-gbp";
    sha256 = "sha256-E3InUeOtmFrmdIK7VnAkf6mPq9esMIWKWQAo8vovNx8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros-pkgs robot rqt-common-plugins rqt-robot-plugins stage-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A metapackage to aggregate several packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
