
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rospy, wireless-msgs }:
buildRosPackage {
  pname = "ros-noetic-wireless-watcher";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "wireless-release";
    rev = "8736ec9b8165cd6ccbb40fc9b6ebc2d900405db7";
    owner = "clearpath-gbp";
    sha256 = "sha256-x+DGAY9zrogalssgS9kX41yPsZxZI46FIMN1q/eCwkk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rospy wireless-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A Python-based which publishes connection information about a linux wireless interface.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
