
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, eigen, orocos-kdl, rostest, tf2, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-tf2-kdl";
  version = "0.6.5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "geometry2-release";
    rev = "5d542a05fe99cde873fdb46a110e00b095ae5a51";
    owner = "ros-gbp";
    sha256 = "sha256-ym2F2xDtQaAQvkFv4wBDrmXtXZ3Kcz0ENNb+cL8qQBg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ eigen orocos-kdl tf2 tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''KDL binding for tf2'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
