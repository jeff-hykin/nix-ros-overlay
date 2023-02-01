
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-radial-menu-msgs";
  version = "0.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "radial_menu_ros-release";
    rev = "cc8fab7abcda89f5ba6acca8c14fcf3839ab61c6";
    owner = "yoshito-n-students";
    sha256 = "sha256-F9JWDtW1NX6N/XYbnkANFNnZAsveUVLKGpnNEEJuRok=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The radial_menu_msgs package'';
    license = with lib.licenses; [ mit ];
  };
}
