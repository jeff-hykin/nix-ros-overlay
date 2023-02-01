
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, genmsg, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-gencpp";
  version = "0.6.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gencpp-release";
    rev = "98771ab3fe5aff1350659014993e805956630678";
    owner = "ros-gbp";
    sha256 = "sha256-rcC8ovZE7/49tC9pmDQx4k43dMdwGo8OmgE1Kwfvgx0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.setuptools ];
  propagatedBuildInputs = [ genmsg ];
  nativeBuildInputs = [ catkin pythonPackages.setuptools ];

  meta = {
    description = ''C++ ROS message and service generators.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
