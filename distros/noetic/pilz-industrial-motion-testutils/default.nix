
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, moveit-commander }:
buildRosPackage {
  pname = "ros-noetic-pilz-industrial-motion-testutils";
  version = "0.7.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pilz_common-release";
    rev = "34e165a8aeb865b12c9e5aa37dd1dd7b34f90685";
    owner = "PilzDE";
    sha256 = "sha256-Y405fmpCVAC8NRxhy2BIhI6tYpVkK+LAwKnAPz1haL8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ moveit-commander ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Helper scripts and functionality to test industrial motion generation'';
    license = with lib.licenses; [ asl20 ];
  };
}
