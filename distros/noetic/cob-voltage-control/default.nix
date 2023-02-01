
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-msgs, cob-phidgets, dynamic-reconfigure, python3Packages, roscpp, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-cob-voltage-control";
  version = "0.7.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_driver-release";
    rev = "af7809072a46a85afccd164940a6f6cd9380ea5e";
    owner = "ipa320";
    sha256 = "sha256-ER12b2Il7mA1rH5BOjyh1dnos5z0ptTbmBs59KsxNAQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-msgs cob-phidgets dynamic-reconfigure python3Packages.matplotlib python3Packages.tkinter roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Interface to IO board that manages emergency stop and battery voltage on rob@work 3'';
    license = with lib.licenses; [ asl20 ];
  };
}
