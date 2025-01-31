
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, schunk-description, schunk-libm5api, schunk-powercube-chain, schunk-sdh, schunk-simulated-tactile-sensors }:
buildRosPackage {
  pname = "ros-melodic-schunk-modular-robotics";
  version = "0.6.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "schunk_modular_robotics-release";
    rev = "e57f71b17bea34d127579a7f229a73a1b3ec776b";
    owner = "ipa320";
    sha256 = "sha256-Z+6LdOA56MdhIkPLmMNsNbeiQ3LYvICqOiwFj7fQdn4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ schunk-description schunk-libm5api schunk-powercube-chain schunk-sdh schunk-simulated-tactile-sensors ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This stack includes packages that provide access to the Schunk hardware through ROS messages, services and actions.'';
    license = with lib.licenses; [ asl20 ];
  };
}
