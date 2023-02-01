
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, genmsg }:
buildRosPackage {
  pname = "ros-melodic-gennodejs";
  version = "2.0.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gennodejs-release";
    rev = "5ab7537799995ece83fe594fc0c1aa26a530219e";
    owner = "RethinkRobotics-release";
    sha256 = "sha256-UJ76t3rPxaMOnKzT+qyyoBbUT+yQvF+saiJgtzIT9Bw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ genmsg ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Javascript ROS message and service generators.'';
    license = with lib.licenses; [ asl20 ];
  };
}
