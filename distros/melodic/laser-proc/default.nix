
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nodelet, pluginlib, rosconsole, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-laser-proc";
  version = "0.1.5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "laser_proc-release";
    rev = "286a229144e66b1d2045a9da52c080d693e3f060";
    owner = "ros-gbp";
    sha256 = "sha256-425rbbJol1PAzrEJ+45thb/cPqU01ZN48E+UPJtsPY0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ nodelet pluginlib rosconsole roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''laser_proc'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
