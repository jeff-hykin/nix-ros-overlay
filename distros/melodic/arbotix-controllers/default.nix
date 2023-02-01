
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, arbotix-python, catkin, tf, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-arbotix-controllers";
  version = "0.10.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "arbotix_ros-release";
    rev = "3518a0acc1c6de55812acba59e611a69ca5b8df7";
    owner = "vanadiumlabs";
    sha256 = "sha256-5XJtEPpN251GvOjtQhUsozjyiqja9VfHxLzRIEVmEIw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ arbotix-python tf trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Extends the arbotix_python package with a number of more sophisticated ROS wrappers for common devices.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
