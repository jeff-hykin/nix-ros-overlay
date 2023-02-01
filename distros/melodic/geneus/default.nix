
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, genmsg }:
buildRosPackage {
  pname = "ros-melodic-geneus";
  version = "2.2.6";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "geneus-release";
    rev = "40da8c713d50dff5ad3f3d0a85d99021df1d43f7";
    owner = "tork-a";
    sha256 = "sha256-jU3g3HbBbxZicXeqmApz8s7kGqbozsDAmzn2COAlvD0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ genmsg ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''EusLisp ROS message and service generators.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
