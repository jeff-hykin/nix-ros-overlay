
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, pr2-common-action-msgs, pr2-controllers-msgs, rospy, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-pr2-tuck-arms-action";
  version = "0.0.11";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_common_actions-release";
    rev = "b4b1c9bb468ce8c3bde414d0b2129b4eb38f4304";
    owner = "pr2-gbp";
    sha256 = "sha256-tqYIHCCWRBGw30zWG71SpPaHp4evybIyvG1Nc0qXIc4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib actionlib-msgs pr2-common-action-msgs pr2-controllers-msgs rospy trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_tuck_arms_action package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
