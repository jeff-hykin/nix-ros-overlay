
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, rospy }:
buildRosPackage {
  pname = "ros-noetic-ddynamic-reconfigure-python";
  version = "0.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ddynamic_reconfigure_python-release";
    rev = "715ad90e0cfeaf2a24817f3237182c81600108ca";
    owner = "pal-gbp";
    sha256 = "sha256-JLcpi+inwRitdo5Xol8fy27HaHg0wy9iD2NUtXfqdnc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ddynamic_reconfigure_python package contains
    a class to instantiate dynamic reconfigure servers on the fly
    registering variables'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
