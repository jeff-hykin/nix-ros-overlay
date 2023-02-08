
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, moveit-msgs, moveit-resources-fanuc-moveit-config, moveit-ros-planning-interface, python3, python3Packages, rospy, rostest, sensor-msgs, shape-msgs, tf }:
buildRosPackage {
  pname = "ros-noetic-moveit-commander";
  version = "1.1.11-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ros-gbp";
        repo = "moveit-release";
        rev = "release/noetic/moveit_commander/1.1.11-1";
        sha256 = "7b87f1713cb058c492b10c498426c329e26d9ae2014942623bff40ee59c2b0c1";
      };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.catkin-pkg ];
  checkInputs = [ moveit-resources-fanuc-moveit-config rostest ];
  propagatedBuildInputs = [ geometry-msgs moveit-msgs moveit-ros-planning-interface python3 rospy sensor-msgs shape-msgs tf ];
  nativeBuildInputs = [ catkin python3Packages.catkin-pkg ];

  meta = {
    description = ''Python interfaces to MoveIt'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
