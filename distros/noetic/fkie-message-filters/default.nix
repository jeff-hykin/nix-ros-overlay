
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, image-transport, roscpp, rostest, rosunit, sensor-msgs, std-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-noetic-fkie-message-filters";
  version = "1.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "message_filters-release";
    rev = "9bf94361c163b9bfec0638637b7a5b79c2227ae7";
    owner = "fkie-release";
    sha256 = "sha256-QFSEVgbep32zGMY9OffccZ80J7SEc6n0wrni+Hc6/SY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest rosunit std-msgs ];
  propagatedBuildInputs = [ image-transport roscpp sensor-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Improved ROS message filters'';
    license = with lib.licenses; [ asl20 ];
  };
}
