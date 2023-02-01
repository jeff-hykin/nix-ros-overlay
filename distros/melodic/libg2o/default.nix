
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake, eigen, libGL, libGLU, suitesparse }:
buildRosPackage {
  pname = "ros-melodic-libg2o";
  version = "2018.3.25";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libg2o-release";
    rev = "4bead40a8a6a5adeaa1f34d364ecf3aeaaac9e68";
    owner = "ros-gbp";
    sha256 = "sha256-2gxC3lg9FrSJs333NGrt4UDtIEyX4ZtUqfIwd2o5E9w=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ boost catkin eigen libGL libGLU suitesparse ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''The libg2o library from http://openslam.org/g2o.html'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
