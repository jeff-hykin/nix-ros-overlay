
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nlopt, rospy, swig, tf, tf-conversions, trac-ik-lib }:
buildRosPackage {
  pname = "ros-noetic-trac-ik-python";
  version = "1.6.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "trac_ik-release";
    rev = "140a70df33589b43d8ae1701dfebc4e692b15095";
    owner = "traclabs";
    sha256 = "sha256-MjZN/QZDjpxlSMbQ7FVi2xBKPBOoJ9xji49+BW4XWdU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ nlopt rospy swig tf tf-conversions trac-ik-lib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The trac_ik_python package contains a python wrapper using SWIG
  for trac_ik_lib'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
