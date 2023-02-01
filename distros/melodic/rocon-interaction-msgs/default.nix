
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, rocon-std-msgs, uuid-msgs }:
buildRosPackage {
  pname = "ros-melodic-rocon-interaction-msgs";
  version = "0.9.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rocon_msgs-release";
    rev = "2203f7fcedd9bbdfb9e806973e0e59f591008ffc";
    owner = "yujinrobot-release";
    sha256 = "sha256-UtBF6oetRMlkwZ71vx8mCnCGKTrLih19vFLlyCg3MbE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime rocon-std-msgs uuid-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages used by rocon interactions.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
