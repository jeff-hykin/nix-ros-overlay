
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, catkin-pip, pyros-test, rosgraph, roslaunch, roslint, rosnode, rospy, rostest, rosunit }:
buildRosPackage {
  pname = "ros-melodic-pyros-utils";
  version = "0.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pyros-utils-release";
    rev = "7aef0cdffe3c0d78eabe094a45ace8e8d9492d61";
    owner = "pyros-dev";
    sha256 = "sha256-yrigwBpDmPZaDEQ17k3/Z0BeA/UhLPs0Q5yKn/wCdeo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin-pip roslint ];
  checkInputs = [ pyros-test rosnode rosunit ];
  propagatedBuildInputs = [ rosgraph roslaunch rospy rostest ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Miscellaneous tools for pyROS'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
