
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, aws-ros1-common, catkin, gtest, lex-common, lex-common-msgs, roscpp, rostest, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-lex-node";
  version = "2.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lex_node-release";
    rev = "f27759f4894fb184b0e5070ec5134a6339d7d127";
    owner = "aws-gbp";
    sha256 = "sha256-okwyg5csz6NUfytIBl0EJmL0ypb/ZdSi3dIm2/5V41o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest rostest ];
  propagatedBuildInputs = [ aws-common aws-ros1-common lex-common lex-common-msgs roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package providing a ROS node for interacting with Amazon Lex'';
    license = with lib.licenses; [ asl20 ];
  };
}
