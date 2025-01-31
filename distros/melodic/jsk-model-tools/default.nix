
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eus-assimp, euscollada }:
buildRosPackage {
  pname = "ros-melodic-jsk-model-tools";
  version = "0.4.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_model_tools-release";
    rev = "bb32dd3e5d4b7a60492ca4ee507ef15876cc2bc6";
    owner = "tork-a";
    sha256 = "sha256-zvzP7mUCPf61EnF41GEPxJ3kB6VrI1gLE+HEhG1Q0jM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eus-assimp euscollada ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>Metapackage that contains model_tools package for jsk-ros-pkg</p>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
