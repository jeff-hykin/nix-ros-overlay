
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-navigation-global, cob-supported-robots, gmapping, roslaunch }:
buildRosPackage {
  pname = "ros-melodic-cob-mapping-slam";
  version = "0.6.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_navigation-release";
    rev = "b0f41a973f43de5f8a979f6ae4cde67e1a067301";
    owner = "ipa320";
    sha256 = "sha256-Ge25/wzaKuof9ee+1bPLMXvWOy+m/wuLYJXSQPsZUBU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ cob-supported-robots roslaunch ];
  propagatedBuildInputs = [ cob-navigation-global gmapping ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''cob_mapping_slam holds launch files for running SLAM using the <a href="http://ros.org/wiki/gmapping">gmapping</a> package.'';
    license = with lib.licenses; [ asl20 ];
  };
}
