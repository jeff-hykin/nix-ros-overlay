
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geographic-msgs, geometry-msgs, marti-common-msgs, message-generation, message-runtime, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-marti-nav-msgs";
  version = "0.11.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "marti_messages-release";
    rev = "9ed78b06e7d966cbf92b8091fc2925ef50584846";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-bH1lf6wdHr8UzyN8D5wvFa9kp6zcQqH0CQl6o3vndDI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geographic-msgs geometry-msgs marti-common-msgs message-runtime sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''marti_nav_msgs'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
