
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, libccd, octomap }:
buildRosPackage {
  pname = "ros-melodic-fcl-catkin";
  version = "0.6.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fcl_catkin-release";
    rev = "7892a1856278ba9bd2f5d149e7ec88925c552213";
    owner = "wxmerkt";
    sha256 = "sha256-WcsDCNzbxl+69WQ6m1ctq7rgXfwPDQ88VqXiRPC8rpU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen libccd octomap ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''fcl_catkin'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
