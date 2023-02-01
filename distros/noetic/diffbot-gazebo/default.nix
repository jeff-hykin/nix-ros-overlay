
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diffbot-control, diffbot-description, gazebo-plugins, gazebo-ros, gazebo-ros-control, xacro }:
buildRosPackage {
  pname = "ros-noetic-diffbot-gazebo";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "diffbot-release";
    rev = "2ea83796a979e61cd28fb8b67d40d504121c5d27";
    owner = "ros-mobile-robots-release";
    sha256 = "sha256-29/WafwJSKsISjxGKytdioQistVlep6oYk2WfJCesj0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diffbot-control diffbot-description gazebo-plugins gazebo-ros gazebo-ros-control xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The diffbot_gazebo package'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
