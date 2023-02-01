
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, allocators, catkin, lockfree, rosatomic, rosrt }:
buildRosPackage {
  pname = "ros-melodic-ros-realtime";
  version = "1.0.25";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_realtime-release";
    rev = "b0b7a5977c44353d911a6e232a4ecb27bc4692e7";
    owner = "ros-gbp";
    sha256 = "sha256-cSPJq35ndIuCxfW/qa08dpOhEvEk0rlT+bOWNUBVBGc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ allocators lockfree rosatomic rosrt ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ros_realtime package'';
    license = with lib.licenses; [ "TODO-CATKIN-PACKAGE-LICENSE" ];
  };
}
