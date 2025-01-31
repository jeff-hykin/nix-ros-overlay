
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, urdf }:
buildRosPackage {
  pname = "ros-melodic-hebi-description";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hebi_description-release";
    rev = "fe1ff063f00f06c8377e0657afa796cad2111356";
    owner = "HebiRobotics";
    sha256 = "sha256-5Y/NYNb90T10xDCH4eMDKBFDspYQZfHW0mWzWsCBNlA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS models for HEBI components'';
    license = with lib.licenses; [ mit ];
  };
}
