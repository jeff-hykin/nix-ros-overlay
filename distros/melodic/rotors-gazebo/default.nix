
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-msgs, gazebo-plugins, geometry-msgs, joy, mav-msgs, roscpp, rotors-gazebo-plugins, sensor-msgs, xacro }:
buildRosPackage {
  pname = "ros-melodic-rotors-gazebo";
  version = "2.2.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rotors_simulator-release";
    rev = "8d4352b09ce5e08eea68ad292a7bb3d3d251ae36";
    owner = "ethz-asl";
    sha256 = "sha256-EZav/Vphyxm4tgp5kBjNbpA5f/B6/BQ4Qnn9BxYWiUM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-msgs gazebo-plugins geometry-msgs joy mav-msgs roscpp rotors-gazebo-plugins sensor-msgs xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rotors_gazebo package'';
    license = with lib.licenses; [ "ASL-2.0" ];
  };
}
