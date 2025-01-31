
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cl-utils, sbcl }:
buildRosPackage {
  pname = "ros-noetic-cl-transforms";
  version = "0.2.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roslisp_common-release";
    rev = "57e3de16a019988ecd76f29bc178ff205fb6e022";
    owner = "ros-gbp";
    sha256 = "sha256-njq2blq/F5C7SjWWmPOYL9/qE5LVDU9YmcCcY9fp3Fw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cl-utils sbcl ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Homogeneous transform library for Common Lisp.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
