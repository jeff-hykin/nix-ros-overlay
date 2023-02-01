
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, roslint, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-rt-usb-9axisimu-driver";
  version = "1.0.1-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rt_usb_9axisimu_driver-release";
    rev = "d63e15c758b45471b109f2b162bd5ed08f3b19ca";
    owner = "rt-net-gbp";
    sha256 = "sha256-Mq8KbH32cTlyZtFtTyi+RLSQXhupXHtrsjeItyRVA+8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp roslint sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rt_usb_9axisimu_driver package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
