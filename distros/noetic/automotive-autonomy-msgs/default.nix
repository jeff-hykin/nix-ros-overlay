
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, automotive-navigation-msgs, automotive-platform-msgs, catkin, ros-environment }:
buildRosPackage {
  pname = "ros-noetic-automotive-autonomy-msgs";
  version = "3.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "automotive_autonomy_msgs-release";
    rev = "e055034cf4dfc6a3ad12fa8af35afd6778fb3b9b";
    owner = "astuff";
    sha256 = "sha256-R/GduU+VD3B9INpzOpa84Bl42xFAtGthn8PEt8iYmpw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ros-environment ];
  propagatedBuildInputs = [ automotive-navigation-msgs automotive-platform-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages for vehicle automation'';
    license = with lib.licenses; [ mit ];
  };
}
