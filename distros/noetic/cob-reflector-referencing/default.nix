
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-cob-reflector-referencing";
  version = "0.6.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_substitute-release";
    rev = "1c813024b2e34c0e6bfe32d263b6476d31e8ce2c";
    owner = "ipa320";
    sha256 = "sha256-yupV/pC15zhbZ75JqAGl2mi1ijdJwzWrzUys3GGvJQg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides a node broadcasting a tf frame based on reflector markers detected within sensor_msgs::LaserScan messages.
    It can be used to position/reference a robot wrt to the reflektor markers.'';
    license = with lib.licenses; [ asl20 ];
  };
}
