
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nodelet, pluginlib, rosconsole, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-laser-proc";
  version = "0.1.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "laser_proc-release";
    rev = "1e9c7cf73610717ea9f364f2fb407f4a96a26b96";
    owner = "ros-gbp";
    sha256 = "sha256-l1f0cy64NCRxPwM/6QM3e1Hg6X8wjiixb16t16zZgAI=";
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
