
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-pyquaternion";
  version = "0.9.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pyquaternion-release";
    rev = "79720c2f2161b0510d793211caebf73a17fe60e6";
    owner = "Achllle";
    sha256 = "sha256-2pwJN5emYqg2sC+069bxaRTnievK0P8fFGZFBOGGteo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ python3Packages.numpy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''quaternion operations'';
    license = with lib.licenses; [ mit ];
  };
}
