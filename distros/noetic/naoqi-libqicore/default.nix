
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, naoqi-libqi }:
buildRosPackage {
  pname = "ros-noetic-naoqi-libqicore";
  version = "2.9.7";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ros-naoqi";
        repo = "libqicore-release";
        rev = "release/noetic/naoqi_libqicore/2.9.7-0";
        sha256 = "sha256-HbCSC/ib3FHb6Fv+UAUeW977LvzOAGshLBJ3n/MbNg8=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ naoqi-libqi ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Aldebaran's libqicore: a layer on top of libqi'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
