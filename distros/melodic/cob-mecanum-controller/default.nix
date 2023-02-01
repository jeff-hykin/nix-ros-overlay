
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, eigen, geometry-msgs, nav-msgs, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-cob-mecanum-controller";
  version = "0.8.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_control-release";
    rev = "f84e20893e926ce6012625229505126b0443997d";
    owner = "ipa320";
    sha256 = "sha256-qHnEAsasDgbGzgHu4vAhINIv6BizetuBIlx8fwbmc+o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules eigen geometry-msgs nav-msgs roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The cob_mecanum_controller_node provides a lightweight base controller for mecanum drive robots. 
    The out/input for the wheel command/state are wheel velocities in rad/s for the wheels 
    [front left, front right, rear left, rear right]'';
    license = with lib.licenses; [ asl20 ];
  };
}
