
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, flexbe-msgs, rospy, rostest, tf }:
buildRosPackage {
  pname = "ros-noetic-flexbe-core";
  version = "1.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "flexbe_behavior_engine-release";
    rev = "1a5f8f7009bb1a1b079347ef70f0a0e22512a597";
    owner = "FlexBE";
    sha256 = "sha256-Cxkk2YQBvPPc8vhIT69WDR92xMlMbdz1OTW0nzMHisg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  propagatedBuildInputs = [ diagnostic-msgs flexbe-msgs rospy tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''flexbe_core provides the core components for the FlexBE behavior engine.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
