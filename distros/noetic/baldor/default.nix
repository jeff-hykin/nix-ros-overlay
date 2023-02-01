
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-baldor";
  version = "0.1.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "baldor-release";
    rev = "38c8ba9f82c1fdb403118ea8a9de78a03f8204de";
    owner = "crigroup";
    sha256 = "sha256-w0bigdJyTMcuTczFOKblQIlTzRB8UMg/XRZcQlV1Gmo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ python3Packages.numpy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The baldor package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
