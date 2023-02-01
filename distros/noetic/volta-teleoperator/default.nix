
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, geometry-msgs, sensor-msgs, teleop-twist-joy, teleop-twist-keyboard, volta-msgs }:
buildRosPackage {
  pname = "ros-noetic-volta-teleoperator";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "volta-release";
    rev = "ba058806efe682856f8367921ca9db8652f42029";
    owner = "botsync-gbp";
    sha256 = "sha256-K+lAcBfuB7B/8QUOfF3JKe5MSPRSmfpymPWWG9bn+6s=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib-msgs geometry-msgs sensor-msgs teleop-twist-joy teleop-twist-keyboard volta-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The volta_teleoperator package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
