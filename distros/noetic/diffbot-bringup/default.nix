
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, teleop-twist-keyboard }:
buildRosPackage {
  pname = "ros-noetic-diffbot-bringup";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "diffbot-release";
    rev = "df020546d6c2a97e72cee09bf0dd6667db36802a";
    owner = "ros-mobile-robots-release";
    sha256 = "sha256-OnBkzEidOCNC6DB6aAA06MHp/Q9wTqhzJNgMIcETZjc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ teleop-twist-keyboard ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The diffbot_bringup package'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
