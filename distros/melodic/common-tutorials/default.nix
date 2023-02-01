
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-tutorials, catkin, nodelet-tutorial-math, pluginlib-tutorials, turtle-actionlib }:
buildRosPackage {
  pname = "ros-melodic-common-tutorials";
  version = "0.1.11";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "common_tutorials-release";
    rev = "88a92c73e544b8a1b27b9fa4569e05bd72e278bc";
    owner = "ros-gbp";
    sha256 = "sha256-7mcLC7HyNMvEiafuBceHLd1direAJGq30wubjFMHggE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib-tutorials nodelet-tutorial-math pluginlib-tutorials turtle-actionlib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage that contains common tutorials'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
