
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, mavros-msgs, rospy, rqt-gui, rqt-gui-py }:
buildRosPackage {
  pname = "ros-melodic-rqt-rotors";
  version = "2.2.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rotors_simulator-release";
    rev = "68034bdb4e7e6ad0536379cedfb1ba3acd5fb061";
    owner = "ethz-asl";
    sha256 = "sha256-eTHhHTIHRjkwnmSJd73i8Nlbf2hP0uK1XkfQ8WnsneU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ mavros-msgs rospy rqt-gui rqt-gui-py ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rqt_rotors package'';
    license = with lib.licenses; [ "ASL-2.0" ];
  };
}
