
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, yocs-cmd-vel-mux, yocs-controllers, yocs-diff-drive-pose-controller, yocs-joyop, yocs-keyop, yocs-math-toolkit, yocs-rapps, yocs-safety-controller, yocs-velocity-smoother, yocs-virtual-sensor, yocs-waypoints-navi }:
buildRosPackage {
  pname = "ros-melodic-yujin-ocs";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "9e78f68857af6a4fa0e5a448c85b3f5bf6cf0ce8";
    owner = "yujinrobot-release";
    sha256 = "sha256-jDHGad1lvfDZjFKHdotf6xIF9NoiedxbG9GdGkl+5ZQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ yocs-cmd-vel-mux yocs-controllers yocs-diff-drive-pose-controller yocs-joyop yocs-keyop yocs-math-toolkit yocs-rapps yocs-safety-controller yocs-velocity-smoother yocs-virtual-sensor yocs-waypoints-navi ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Yujin Robot's open-source control software'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
