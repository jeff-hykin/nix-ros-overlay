
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-volta-rules";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "volta-release";
    rev = "e3ecb39fc08c979e2d600998236608bc945c65a3";
    owner = "botsync-gbp";
    sha256 = "sha256-9uenWaSE32Emdo5jaVMXtfOcjC7T172ViJpVwzRQokc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ python3Packages.pyusb ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The volta_rules package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
