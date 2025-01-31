
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-dev, gazebo-msgs }:
buildRosPackage {
  pname = "ros-melodic-uuv-world-plugins";
  version = "0.6.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uuv_simulator-release";
    rev = "197ce267f776bdf02b1b154886e9816adc2dab37";
    owner = "uuvsimulator";
    sha256 = "sha256-UZc6YV1oJBAF/7MG9ii104RZY5pDHA3puEIiLwPE0Q4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-dev gazebo-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The uuv_world_plugins package'';
    license = with lib.licenses; [ asl20 ];
  };
}
