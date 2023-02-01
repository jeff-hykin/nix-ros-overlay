
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, turtlebot4-cpp-examples, turtlebot4-python-examples }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-examples";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_examples-release";
    rev = "f5fdf659d3fa33ba1308db612e92ba1de6a3baad";
    owner = "ros2-gbp";
    sha256 = "sha256-J2PBzWABSoRPrGl5bI+bhBI344w/+cCVaWfqfy7WpsE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot4-cpp-examples turtlebot4-python-examples ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Turtlebot4 Examples Metapackage'';
    license = with lib.licenses; [ asl20 ];
  };
}
