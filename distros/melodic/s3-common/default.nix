
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, boost, catkin, cmake, gtest }:
buildRosPackage {
  pname = "ros-melodic-s3-common";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag_uploader-release";
    rev = "1a22efd70cdb184e2ca531eedf55dfb98f7e4c9c";
    owner = "aws-gbp";
    sha256 = "sha256-gXFna7MZ2Hy5i15mlFnYZTE1oysVww2hdHWm3KwYi5I=";
  };

  buildType = "cmake";
  buildInputs = [ catkin cmake ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ aws-common boost ];
  nativeBuildInputs = [ catkin cmake ];

  meta = {
    description = ''Common utilities for interacting with AWS S3'';
    license = with lib.licenses; [ asl20 ];
  };
}
