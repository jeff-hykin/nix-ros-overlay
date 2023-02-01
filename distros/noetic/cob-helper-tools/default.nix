
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-msgs, cob-script-server, diagnostic-msgs, dynamic-reconfigure, message-generation, message-runtime, python3Packages, rospy, std-srvs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-cob-helper-tools";
  version = "0.6.30-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_command_tools-release";
    rev = "f5de04ea5a0c55b4512e94caf7d2b7aa05a8abf9";
    owner = "ipa320";
    sha256 = "sha256-GkmCY1od+ipOUaPzbP/DUpWzpjpo59O32lQ//f5egLU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation python3Packages.setuptools ];
  propagatedBuildInputs = [ cob-msgs cob-script-server diagnostic-msgs dynamic-reconfigure message-runtime rospy std-srvs tf visualization-msgs ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''Helper scripts for Care-O-bot'';
    license = with lib.licenses; [ asl20 ];
  };
}
