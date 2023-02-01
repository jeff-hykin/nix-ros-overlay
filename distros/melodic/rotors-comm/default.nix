
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, geometry-msgs, message-generation, message-runtime, octomap-msgs }:
buildRosPackage {
  pname = "ros-melodic-rotors-comm";
  version = "2.2.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rotors_simulator-release";
    rev = "084be855d23442f6629384f3ac33df752bfa7bab";
    owner = "ethz-asl";
    sha256 = "sha256-gprw83t7KQy/XTyHa1FCzzVjjqip1QWkX4E/djlCoeA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules geometry-msgs message-generation message-runtime octomap-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''RotorS specific messages and services.'';
    license = with lib.licenses; [ "ASL-2.0" ];
  };
}
