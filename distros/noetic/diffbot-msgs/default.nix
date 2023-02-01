
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-diffbot-msgs";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "diffbot-release";
    rev = "15d998394a618690aa12b51029cab43a5660a257";
    owner = "ros-mobile-robots-release";
    sha256 = "sha256-uHos9tBdpSf/LXaRyocsP+xCT/KyBooCo4Hg40fe52g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The diffbot_msgs package'';
    license = with lib.licenses; [ "BSDv3" ];
  };
}
