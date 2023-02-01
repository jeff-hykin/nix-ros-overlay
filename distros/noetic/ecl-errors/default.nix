
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-config, ecl-license }:
buildRosPackage {
  pname = "ros-noetic-ecl-errors";
  version = "0.61.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_lite-release";
    rev = "46814d10b47c44242e6f7135e656e919a3f18cf4";
    owner = "yujinrobot-release";
    sha256 = "sha256-4DIby9C1Z0gGOjQxuV9Mk11JDhEd/0U5Ng2Qgkw0yQs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-config ecl-license ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This library provides lean and mean error mechanisms. 
    It includes c style error functions as well as a few 
    useful macros. For higher level mechanisms, 
    refer to ecl_exceptions.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
