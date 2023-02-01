
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, euslisp, geneus, roseus }:
buildRosPackage {
  pname = "ros-melodic-jsk-roseus";
  version = "1.7.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_roseus-release";
    rev = "b70d406743bf2764d1938d0e030be7a16d5f8963";
    owner = "tork-a";
    sha256 = "sha256-X6V5+qyVJ7MBm0vlvbxVkM1zigy+8+yV1tmJ71QavmA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ euslisp geneus roseus ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>Metapackage that contains roseus package for jsk-ros-pkg</p>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
