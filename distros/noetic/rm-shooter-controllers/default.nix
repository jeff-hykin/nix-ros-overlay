
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, effort-controllers, rm-common, roscpp }:
buildRosPackage {
  pname = "ros-noetic-rm-shooter-controllers";
  version = "0.1.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rm_controllers-release";
    rev = "e49d42017092f3f140f47929fabf99c23c98ac3b";
    owner = "rm-controls";
    sha256 = "sha256-bpVf61ILAIWUhc5SU4uardry0tA4wOokhJ26L4Amk9Q=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure effort-controllers rm-common roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''RoboMaster standard robot Shooter controller'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
