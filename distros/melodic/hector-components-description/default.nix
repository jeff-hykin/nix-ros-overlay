
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hector-sensors-description, hector-xacro-tools, xacro }:
buildRosPackage {
  pname = "ros-melodic-hector-components-description";
  version = "0.5.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_models-release";
    rev = "3794ce38bb67663a37aa35e53e428b28491620fe";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-kAe3BZv7C2I183iMQQ8LKxdbiPRNZ0gm433YhWDWZD4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hector-sensors-description hector-xacro-tools xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_components_description contains URDF xacro macros for robot components, so they are easily attachable to robot models.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
