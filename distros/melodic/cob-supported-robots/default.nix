
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-cob-supported-robots";
  version = "0.6.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_supported_robots-release";
    rev = "35d15b4dd16c3ba7dc132b55471c46327a693902";
    owner = "ipa320";
    sha256 = "sha256-NEOfbZeVn6UgG/vjagSnFUYRhB4hyxj+YgsFBuwBy28=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains the list of supported robots within the care-o-bot family.'';
    license = with lib.licenses; [ asl20 ];
  };
}
