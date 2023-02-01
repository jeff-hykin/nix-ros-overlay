
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, rospy, turtle-actionlib, turtlesim }:
buildRosPackage {
  pname = "ros-melodic-turtlesim-dash-tutorial";
  version = "1.0.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlesim_dash_tutorial-release";
    rev = "4712b34489d13846b21dd2ce100f19a554fe0a96";
    owner = "banerjs-ros-release";
    sha256 = "sha256-2sG46VbSBhyWbd2yiSJQXH+OXkHH6vjDjs5wU1n+KKo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib rospy turtle-actionlib turtlesim ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The turtlesim_dash_tutorial package'';
    license = with lib.licenses; [ mit ];
  };
}
