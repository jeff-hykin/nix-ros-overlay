
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hector-sensors-description, hector-xacro-tools }:
buildRosPackage {
  pname = "ros-melodic-hector-models";
  version = "0.5.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_models-release";
    rev = "cb18aa635ba056fe332b08ddd84d78472fec4f85";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-BasPZjbK9TJNu7bTiYOY9L/VegUcajnfQaHmF/MZ6C4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hector-sensors-description hector-xacro-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_models contains (urdf) models of robots, sensors etc.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
