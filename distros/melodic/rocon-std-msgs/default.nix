
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, rocon-service-pair-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rocon-std-msgs";
  version = "0.9.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rocon_msgs-release";
    rev = "11d7b02f5c1ccce25c16b8f9819313687bee0c13";
    owner = "yujinrobot-release";
    sha256 = "sha256-QT9y2hUcOFhMs6TbYceMs+yP2q/mLIsIEobTXS2wh0Q=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime rocon-service-pair-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Standard messages used by other rocon specific package types.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
