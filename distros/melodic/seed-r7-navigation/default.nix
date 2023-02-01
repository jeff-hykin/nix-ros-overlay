
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, amcl, catkin, gmapping, joy, map-server, move-base, move-base-msgs, nav-msgs, rospy, teb-local-planner, teleop-twist-joy, urg-node }:
buildRosPackage {
  pname = "ros-melodic-seed-r7-navigation";
  version = "0.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "seed_r7_ros_pkg-release";
    rev = "b1f346afcbdfa46447c577723c6586b4cc12be04";
    owner = "seed-solutions";
    sha256 = "sha256-IxaslCNF2wkKGsmixO3cB88huP5PncFce+03g0qi6eA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ amcl gmapping joy map-server move-base move-base-msgs nav-msgs rospy teb-local-planner teleop-twist-joy urg-node ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The seed_r7_navigation package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
