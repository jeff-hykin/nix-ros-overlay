
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-filters, nodelet, roscpp, roslaunch, sensor-msgs, tf, tf2, tf2-geometry-msgs, tf2-ros, tf2-sensor-msgs, topic-tools }:
buildRosPackage {
  pname = "ros-melodic-imu-transformer";
  version = "0.2.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "imu_pipeline-release";
    rev = "e542283df68881d2f7eae66da2e22998b49f7b46";
    owner = "ros-gbp";
    sha256 = "sha256-26grohttwVTU27kakuVEWI8lMToXXoDgpdsGkKWkpB4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch tf2-geometry-msgs ];
  propagatedBuildInputs = [ geometry-msgs message-filters nodelet roscpp sensor-msgs tf tf2 tf2-ros tf2-sensor-msgs topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Node/nodelet combination to transform sensor_msgs::Imu data from one frame into another.'';
    license = with lib.licenses; [ "GPL" ];
  };
}
