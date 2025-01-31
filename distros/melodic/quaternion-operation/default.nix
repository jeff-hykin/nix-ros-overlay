
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, geometry-msgs, roscpp, rostest }:
buildRosPackage {
  pname = "ros-melodic-quaternion-operation";
  version = "0.0.3-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "quaternion_operation-release";
    rev = "7f2d521bcbca5bfd78777f0779f8fff0a522dc7f";
    owner = "OUXT-Polaris";
    sha256 = "sha256-backXkAatEIWcXu7beYIjhyEfbhDC7j2QFBLvg+DQeQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen geometry-msgs roscpp rostest ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The quaternion_operation package'';
    license = with lib.licenses; [ asl20 ];
  };
}
