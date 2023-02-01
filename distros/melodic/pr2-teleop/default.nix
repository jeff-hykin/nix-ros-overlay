
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, geometry-msgs, pr2-controllers-msgs, roscpp, rospy, std-msgs, tf, topic-tools }:
buildRosPackage {
  pname = "ros-melodic-pr2-teleop";
  version = "0.6.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_apps-release";
    rev = "0620ede64a973678ec69a4d675e919dc50434912";
    owner = "pr2-gbp";
    sha256 = "sha256-wrbEaXrVFoRroKkshNDh9FJ2113Omqq0pTmy5EuBxX0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib geometry-msgs pr2-controllers-msgs roscpp rospy std-msgs tf topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_teleop package'';
    license = with lib.licenses; [ "TODO-CATKIN-PACKAGE-LICENSE" ];
  };
}
