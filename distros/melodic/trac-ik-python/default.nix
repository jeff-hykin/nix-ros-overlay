
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rospy, swig, tf, tf-conversions, trac-ik-lib }:
buildRosPackage {
  pname = "ros-melodic-trac-ik-python";
  version = "1.5.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "trac_ik-release";
    rev = "fe9073f92c68fdeaf615f3bc76e44bed62258691";
    owner = "traclabs";
    sha256 = "sha256-2NuygJuEibf/BZE0uCtnXiqVBJz0fjhfbD6OfEiKVpc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rospy swig tf tf-conversions trac-ik-lib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The trac_ik_python package contains a python wrapper using SWIG
  for trac_ik_lib'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
