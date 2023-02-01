
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rospy, wireless-msgs }:
buildRosPackage {
  pname = "ros-melodic-wireless-watcher";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "wireless-release";
    rev = "d3d1f79e64f91f2deb002741fcdc6f266e122269";
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
