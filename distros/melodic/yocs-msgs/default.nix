
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, dynamic-reconfigure, geometry-msgs, message-generation, message-runtime, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-yocs-msgs";
  version = "0.7.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yocs_msgs-release";
    rev = "6ab0409645d4e219a089b6d4bbebc68d0315311d";
    owner = "yujinrobot-release";
    sha256 = "sha256-+BaetgJdswQoEXv4kOv0+M1Uz1sys5Ff3uVM7oQJZPM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs dynamic-reconfigure geometry-msgs message-runtime std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Yujin's Open Control System messages, services and actions'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
