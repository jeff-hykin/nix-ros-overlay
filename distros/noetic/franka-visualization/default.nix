
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, franka-description, libfranka, roscpp, sensor-msgs, xacro }:
buildRosPackage {
  pname = "ros-noetic-franka-visualization";
  version = "0.10.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "franka_ros-release";
    rev = "cca1cf9065f03d42cdd0e1b891b0ee782768979c";
    owner = "frankaemika";
    sha256 = "sha256-sr9NeGx2mzy79LTkzszTHIdYAOPl/9mMKEMAo1laTIM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ franka-description libfranka roscpp sensor-msgs xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains visualization tools for Franka Emika.'';
    license = with lib.licenses; [ asl20 ];
  };
}
