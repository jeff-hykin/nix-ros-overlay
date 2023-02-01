
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, schunk-svh-description }:
buildRosPackage {
  pname = "ros-melodic-schunk-svh-simulation";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "schunk_svh_ros_driver-release";
    rev = "b0c8e9f7bd036a4a29eec7242d194b17a2c28239";
    owner = "fzi-forschungszentrum-informatik";
    sha256 = "sha256-RJVqewQC6NHoWzRcCpMXX41X8r6pPStibig/64ECxSA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ schunk-svh-description ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A Gazebo-based simulation environment for the Schunk SVH'';
    license = with lib.licenses; [ "GPL-3.0-or-later" ];
  };
}
