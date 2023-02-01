
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp }:
buildRosPackage {
  pname = "ros-noetic-ros-ethercat-eml";
  version = "0.4.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_ethercat_eml-release";
    rev = "0c6c6605aa0e2e3399de4edaeb32c6e8cb75b11c";
    owner = "shadow-robot";
    sha256 = "sha256-55GMou8QkdmJmQxZ5Ur/TDcDMO66gv+88UE+eFcI5/Q=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This is an implementation of the EtherCAT master protocol for use wiht ros_ethercar package
      based on the work done at Flanders' Mechatronics Technology Centre and Willow Garage.'';
    license = with lib.licenses; [ "GPL" ];
  };
}
