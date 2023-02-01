
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pluginlib, roscpp }:
buildRosPackage {
  pname = "ros-melodic-pluginlib-tutorials";
  version = "0.1.11";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "common_tutorials-release";
    rev = "dac81313e84a5a9817dd2afe8c3aa3016d3f1f67";
    owner = "ros-gbp";
    sha256 = "sha256-pIa5P5rM4SAZa9eJUOAHo6UHDZb0rsfkMQE+PidkcZQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pluginlib roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pluginlib_tutorials package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
