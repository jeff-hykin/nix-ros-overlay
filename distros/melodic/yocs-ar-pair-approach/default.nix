
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, geometry-msgs, rospy, std-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-yocs-ar-pair-approach";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "753dc889597d07e1f1cddbb078e52837ef237572";
    owner = "yujinrobot-release";
    sha256 = "sha256-cyuIZAYCTHcPNROIuNq9+hBOct0ZOJqRQsXIh2dHOy0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure geometry-msgs rospy std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Search and approach behaviour, moving to a target in front of a pair of ar markers.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
