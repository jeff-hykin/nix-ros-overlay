
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cl-transforms, cl-transforms-stamped, roslisp, tf }:
buildRosPackage {
  pname = "ros-melodic-cl-tf";
  version = "0.2.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roslisp_common-release";
    rev = "44eae6f5dcf36e77af59952cd5feddc97132908c";
    owner = "ros-gbp";
    sha256 = "sha256-7I21v541KUAnMd1JnSPxcloKoQMiXVQXtyXufNLqs64=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cl-transforms cl-transforms-stamped roslisp tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Client implementation to use TF from Common Lisp'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
