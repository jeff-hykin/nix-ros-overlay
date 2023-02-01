
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, industrial-robot-client, simple-message }:
buildRosPackage {
  pname = "ros-melodic-abb-driver";
  version = "1.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "abb_driver-release";
    rev = "30d266f399980e6d4f2fc864e37062f68fe3cd36";
    owner = "ros-industrial-release";
    sha256 = "sha256-QCPnvlFdvkk7nnewpvTTdBl4WKl1+Ze5Vjz5oQ69ANk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin simple-message ];
  propagatedBuildInputs = [ industrial-robot-client ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>
     ROS-Industrial nodes for interfacing with ABB robot controllers.
   </p>
   <p>
     This package is part of the ROS-Industrial program and contains nodes 
     for interfacing with ABB industrial robot controllers.
   </p>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
