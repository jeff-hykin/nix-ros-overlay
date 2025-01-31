
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, geometry-msgs, message-generation, message-runtime, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-pr2-common-action-msgs";
  version = "0.0.11";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_common_actions-release";
    rev = "a7a99f9e18f6a3ff4bd78ec73abb144eb8c7afd7";
    owner = "pr2-gbp";
    sha256 = "sha256-8KktRsZbAEX1CQ+wWMiBGpxk2jIE/H4unymKIos7Pqg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs geometry-msgs message-runtime sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_common_action_msgs package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
