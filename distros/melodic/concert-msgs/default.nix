
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gateway-msgs, message-generation, message-runtime, rocon-app-manager-msgs, rocon-std-msgs, std-msgs, uuid-msgs }:
buildRosPackage {
  pname = "ros-melodic-concert-msgs";
  version = "0.9.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rocon_msgs-release";
    rev = "8fe8cfd132b329fecc42d6e59bcf77658eb0c9ca";
    owner = "yujinrobot-release";
    sha256 = "sha256-rVzgj8uhOJL2z8S2GwRtpXKd5aM3mbieGKvN0WacScE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ gateway-msgs message-runtime rocon-app-manager-msgs rocon-std-msgs std-msgs uuid-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Shared communication types for the concert framework.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
