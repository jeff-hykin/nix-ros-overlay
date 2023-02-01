
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, jackal-gazebo }:
buildRosPackage {
  pname = "ros-foxy-jackal-simulator";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jackal_simulator-release";
    rev = "8cc96531ea9a4d4f071b42bf91f09cee2e11168e";
    owner = "clearpath-gbp";
    sha256 = "sha256-oW5TVuisSMuRdOkQaEgh2BpcKUB8Yei6qqa3VQlJuEU=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ jackal-gazebo ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Packages for simulating Jackal.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
