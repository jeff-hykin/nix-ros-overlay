
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, diagnostic-updater, dynamic-reconfigure, genmsg, geometry-msgs, jsk-footstep-msgs, jsk-footstep-planner, jsk-pcl-ros, jsk-topic-tools, kdl-conversions, kdl-parser, message-filters, message-generation, sensor-msgs, sound-play, std-msgs, tf, tf-conversions, tf2, urdf }:
buildRosPackage {
  pname = "ros-melodic-jsk-footstep-controller";
  version = "0.1.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_control-release";
    rev = "72b6b5cf6f9f0d9f9c6823ec0b10565b0d0dfd41";
    owner = "tork-a";
    sha256 = "sha256-gTfi5vl9Dpj0P0BeGeeWUaLPHFhnlZrNgxwwQ671Y9I=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater dynamic-reconfigure genmsg geometry-msgs jsk-footstep-msgs jsk-footstep-planner jsk-pcl-ros jsk-topic-tools kdl-conversions kdl-parser message-filters message-generation sensor-msgs sound-play std-msgs tf tf-conversions tf2 urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The jsk_footstep_controller package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
