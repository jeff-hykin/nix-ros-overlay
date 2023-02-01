
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp }:
buildRosPackage {
  pname = "ros-melodic-ros-ethercat-eml";
  version = "0.3.2-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_ethercat_eml-release";
    rev = "2a7c783516f5fe1f40918bf04c0ef4a6dee5b581";
    owner = "shadow-robot";
    sha256 = "sha256-XC9f8fOo4jNEjuH388PHLku3cC7y6vCuIC74PEn56+0=";
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
