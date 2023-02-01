
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, hddtemp, pythonPackages, rospy, rostest, tf }:
buildRosPackage {
  pname = "ros-melodic-diagnostic-common-diagnostics";
  version = "1.9.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "diagnostics-release";
    rev = "38c8f49381b5a5ac3d42781489dc47317b674752";
    owner = "ros-gbp";
    sha256 = "sha256-n7XzgIBBedz1nCC5tjiZd2W80jeUT0+9eTr/sEhIEB4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  propagatedBuildInputs = [ diagnostic-updater hddtemp pythonPackages.psutil rospy tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''diagnostic_common_diagnostics'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
