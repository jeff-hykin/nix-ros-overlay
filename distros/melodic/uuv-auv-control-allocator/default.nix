
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-uuv-auv-control-allocator";
  version = "0.6.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uuv_simulator-release";
    rev = "4f2d3921ed6796c6d4c3353789564eb0e78d2454";
    owner = "uuvsimulator";
    sha256 = "sha256-ZjBkhgi9KUKc8XP5yuxAL83USSPLocjUBP03GSFHxX4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Optimal allocation of forces and torques to thruster and fins of AUVs'';
    license = with lib.licenses; [ asl20 ];
  };
}
