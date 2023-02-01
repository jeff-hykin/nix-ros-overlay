
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-rocon-python-redis";
  version = "0.3.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rocon_tools-release";
    rev = "8e357e82e7d2420705146cbf0553031385d46dfa";
    owner = "yujinrobot-release";
    sha256 = "sha256-7Iaa2CHxSPlYepJ2va5P8R6kI19fagHTjznIOennXMg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.catkin-pkg ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Locally patched version of the python redis client (https://github.com/andymccurdy/redis-py).'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
