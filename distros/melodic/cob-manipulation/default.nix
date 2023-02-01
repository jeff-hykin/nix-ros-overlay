
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-collision-monitor, cob-grasp-generation, cob-lookat-action, cob-moveit-bringup, cob-moveit-interface, cob-obstacle-distance-moveit }:
buildRosPackage {
  pname = "ros-melodic-cob-manipulation";
  version = "0.7.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_manipulation-release";
    rev = "16dc7772575e487cc47e691d7d7cb65a650181d3";
    owner = "ipa320";
    sha256 = "sha256-I9OtkTOHeLdobZ7K2fAkQ0WcmH2AGJ3GP065+LlfVvw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-collision-monitor cob-grasp-generation cob-lookat-action cob-moveit-bringup cob-moveit-interface cob-obstacle-distance-moveit ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The cob_manipulation stack includes packages that provide manipulation capabilities for Care-O-bot.'';
    license = with lib.licenses; [ asl20 ];
  };
}
