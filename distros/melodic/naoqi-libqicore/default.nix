
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, naoqi-libqi }:
buildRosPackage {
  pname = "ros-melodic-naoqi-libqicore";
  version = "2.9.0-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libqicore-release";
    rev = "8bf671f3a5653d1b457a5fcdb761cc935c320d97";
    owner = "ros-naoqi";
    sha256 = "sha256-YNTcg/2vAQ2eUaJQZ9/r/w2Fj7MZcm2kqt/+aSOWQ/s=";
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
