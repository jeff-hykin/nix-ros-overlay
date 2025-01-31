
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-point-cloud-publisher-tutorial";
  version = "0.2.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_tutorials-release";
    rev = "d7a80176265c5cf7b3744b890ee8e82fc966ef93";
    owner = "ros-gbp";
    sha256 = "sha256-JyrIyt8qDQu56k/gY/J0UB+zjivZS2qYA2nDt5JCTy8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The point_cloud_publisher_tutorial package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
