
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, gtest, roscpp, rostest }:
buildRosPackage {
  pname = "ros-noetic-ddynamic-reconfigure";
  version = "0.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ddynamic_reconfigure";
    rev = "cd5c06dbc1cacc5fdf31f97d11a8287a774579a0";
    owner = "pal-gbp";
    sha256 = "sha256-7wU8+pg/natOlu90zvVV2vjRO1Gv7TBEiKiPXcpxOuM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest rostest ];
  propagatedBuildInputs = [ dynamic-reconfigure roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ddynamic_reconfigure package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
