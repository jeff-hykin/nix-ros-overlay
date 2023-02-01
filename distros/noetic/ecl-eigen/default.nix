
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, ecl-license, eigen }:
buildRosPackage {
  pname = "ros-noetic-ecl-eigen";
  version = "0.62.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_core-release";
    rev = "30283c6454ffddb2451d96f1db90fd33ef623f67";
    owner = "yujinrobot-release";
    sha256 = "sha256-QnNji8A1hEwOVConctXUfXJ+ZYKminsVXWIos27rpPE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules ];
  propagatedBuildInputs = [ ecl-license eigen ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This provides an Eigen implementation for ecl's linear algebra.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
