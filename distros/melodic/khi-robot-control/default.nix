
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, diagnostic-updater, hardware-interface, joint-limits-interface, joint-state-controller, joint-trajectory-controller, khi-robot-msgs, position-controllers, realtime-tools, rostest, trajectory-msgs, transmission-interface }:
buildRosPackage {
  pname = "ros-melodic-khi-robot-control";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "khi_robot-release";
    rev = "bf55e505bab025b82a4a3ad704b93ca67f84b06f";
    owner = "Kawasaki-Robotics";
    sha256 = "sha256-RR7MZ1af3mOA4v7JUq3XymO6ncD+HHA+G8RcWXHHqSE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin realtime-tools ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ controller-manager diagnostic-updater hardware-interface joint-limits-interface joint-state-controller joint-trajectory-controller khi-robot-msgs position-controllers trajectory-msgs transmission-interface ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS KHI robot controller package based on ros_control'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
