
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake }:
buildRosPackage {
  pname = "ros-noetic-taskflow";
  version = "3.0.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "taskflow-release";
    rev = "1b33822b1cd7811939bf484487afc43da2ee106d";
    owner = "ros-industrial-release";
    sha256 = "sha256-qXjvGJYzXO2AmJpuyKgiPsxBn2BdXbYHHycIXeQyKtg=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ catkin ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''The taskflow package'';
    license = with lib.licenses; [ mit ];
  };
}
