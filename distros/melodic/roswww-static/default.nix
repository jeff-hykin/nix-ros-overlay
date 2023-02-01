
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-roswww-static";
  version = "0.21.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "clover-release";
    rev = "b40d51e5156557cc5022e9762cc5416168e818d2";
    owner = "CopterExpress";
    sha256 = "sha256-uzdO4Yz6u/9yX+LUKfTA3g5l0zj1igy52adYo4b1YEE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Static web pages for ROS packages'';
    license = with lib.licenses; [ mit ];
  };
}
