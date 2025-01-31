
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-melodic-file-uploader-msgs";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag_uploader-release";
    rev = "06b2fa17c03aefef27acc4904dc62d0c3664d868";
    owner = "aws-gbp";
    sha256 = "sha256-HjtUjfkwpWAwo3wI/6oGALUtmaoQQla8En9nK0xAiiE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages and actions for S3 file uploader.'';
    license = with lib.licenses; [ asl20 ];
  };
}
