
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-kobuki-msgs";
  version = "0.7.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kobuki_msgs-release";
    rev = "f71c41464189e88a9638f894fe5c7166590d11bb";
    owner = "yujinrobot-release";
    sha256 = "sha256-pPNOb/rCCyHVD5v9TWCWjYenDPJcoAmRDEn2BUsyG4o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>
      Kobuki message and service types: custom messages and services for Kobuki packages.
    </p>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
