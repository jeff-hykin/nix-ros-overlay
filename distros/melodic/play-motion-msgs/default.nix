
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-melodic-play-motion-msgs";
  version = "0.4.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "play_motion-release2";
    rev = "6112aebf0597c256810496d12cd9617cee667e8b";
    owner = "pal-gbp";
    sha256 = "sha256-go4elR910BzISgWRy3r5mOhleLWfnt+DivRao8iL5LE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages, services and actions used by play_motion.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
