
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, diagnostic-updater, ethercat-hardware, pr2-controller-manager, realtime-tools, roscpp, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-pr2-ethercat";
  version = "1.6.31-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_robot-release";
    rev = "f67561df83b134062d04e0342828352f1a0edc55";
    owner = "pr2-gbp";
    sha256 = "sha256-ThDBv+47NEp9Yk0BfFgD2YvS128CCGfjyh7kO1N56M4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater ethercat-hardware pr2-controller-manager realtime-tools roscpp std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Main loop that runs the robot.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
