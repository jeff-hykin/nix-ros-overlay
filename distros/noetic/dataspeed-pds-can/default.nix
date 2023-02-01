
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, can-msgs, catkin, dataspeed-can-msg-filters, dataspeed-can-usb, dataspeed-pds-msgs, message-filters, nodelet, roscpp, roslaunch, rostest }:
buildRosPackage {
  pname = "ros-noetic-dataspeed-pds-can";
  version = "1.0.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dataspeed_pds-release";
    rev = "b5f83b5ab285f257e21341b9d93d794b605ef7b3";
    owner = "DataspeedInc-release";
    sha256 = "sha256-32FxGBWjrNSrWhFkPQ+nHTkmiDuYbUOX6FGTCgXZpaI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin dataspeed-can-msg-filters ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-usb dataspeed-pds-msgs message-filters nodelet roscpp roslaunch ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Interface to the Dataspeed Inc. Intelligent Power Distribution System (iPDS) via CAN'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
