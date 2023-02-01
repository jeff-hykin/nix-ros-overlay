
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros }:
buildRosPackage {
  pname = "ros-noetic-leo-gazebo-worlds";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leo_simulator-release";
    rev = "c1cdbb783b53c8db296ef80007cef8c2d309e094";
    owner = "fictionlab-gbp";
    sha256 = "sha256-iuAv5uzTHs+F/TWJRzGaeuLy8x20vxmY6h+ec+q1PWA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Gazebo Worlds for simulating Leo Rover'';
    license = with lib.licenses; [ mit ];
  };
}
