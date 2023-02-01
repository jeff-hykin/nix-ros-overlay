
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-msgs, cob-phidgets, dynamic-reconfigure, pythonPackages, roscpp, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-cob-voltage-control";
  version = "0.7.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_driver-release";
    rev = "5afce1928c3ddbd4d9daebc725eeec851499ef3d";
    owner = "ipa320";
    sha256 = "sha256-aCByjPz1Nij2BGLl0ip14QrHTCh7SkstXFQVCYuvmA0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-msgs cob-phidgets dynamic-reconfigure pythonPackages.matplotlib pythonPackages.tkinter roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Interface to IO board that manages emergency stop and battery voltage on rob@work 3'';
    license = with lib.licenses; [ asl20 ];
  };
}
