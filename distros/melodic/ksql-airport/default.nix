
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros }:
buildRosPackage {
  pname = "ros-melodic-ksql-airport";
  version = "0.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uav_testing-release";
    rev = "34ec5950b8817323a4efb5a5b8f5afb3288268a8";
    owner = "ros-gbp";
    sha256 = "sha256-1IZY2Byz5iklWuAp1gMYJ4HQS7ZHyHg06JSuGE2fE68=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ksql_airport package'';
    license = with lib.licenses; [ asl20 ];
  };
}
