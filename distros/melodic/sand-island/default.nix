
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros }:
buildRosPackage {
  pname = "ros-melodic-sand-island";
  version = "0.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uav_testing-release";
    rev = "b13aa1b4f133911a59515ec7b95772f5fd5a76c3";
    owner = "ros-gbp";
    sha256 = "sha256-Qu8ZUw4cADXNCp+RFZh57OKzS23gyQ9oiXEZ8z0LNCg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The sand_island package'';
    license = with lib.licenses; [ asl20 ];
  };
}
