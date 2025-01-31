
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-xv-11-laser-driver";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "xv_11_laser_driver-release";
    rev = "af3ac1af48cbb81d68eb65fbe4f6749e2ed16ba3";
    owner = "rohbotics";
    sha256 = "sha256-xd8dH35fK1pMgD4JhX69dVG7ofLih5D/yYoha5A2M4M=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roscpp sensor-msgs ];
  propagatedBuildInputs = [ boost ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Neato XV-11 Laser Driver. This driver works with the laser when it is removed from the XV-11 Robot as opposed to reading scans from the Neato's USB port.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
