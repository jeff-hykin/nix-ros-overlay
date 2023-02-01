
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, gazebo-ros, gazebo-ros-pkgs, hector-gazebo-plugins, hector-models, robot-state-publisher, roscpp }:
buildRosPackage {
  pname = "ros-melodic-igvc-self-drive-gazebo-plugins";
  version = "0.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "igvc_self_drive_sim-release";
    rev = "d2bfa33c1ed870e085ed67f48ccbacbc0f5301ae";
    owner = "robustify";
    sha256 = "sha256-tvVCnjRpVQBE7T0goiRvb6yaTFaMFiIF7EAdsTA7GPQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure gazebo-ros gazebo-ros-pkgs hector-gazebo-plugins hector-models robot-state-publisher roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Gazebo plugins for IGVC Self-Drive simulator'';
    license = with lib.licenses; [ "BSD-2-Clause" ];
  };
}
