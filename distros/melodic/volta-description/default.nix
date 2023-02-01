
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-volta-description";
  version = "1.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "volta-release";
    rev = "4e84e425da36e12480fcb0b710506180a59af88b";
    owner = "botsync-gbp";
    sha256 = "sha256-raEO4h1y2KE1RN1K2DCVc9OeqSwHrDxu772cUNEpvNw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The volta_description package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
