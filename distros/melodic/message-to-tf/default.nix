
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, nav-msgs, roscpp, sensor-msgs, tf, topic-tools }:
buildRosPackage {
  pname = "ros-melodic-message-to-tf";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_localization-release";
    rev = "b55d73292cb453ed810518132f7258724269a8b7";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-x+51C1xAwUg5hKcirp3Gz0427oxWgHmdrIXyg0rjhhE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs roscpp sensor-msgs tf topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''message_to_tf translates pose information from different kind of common_msgs message types to tf. Currently the node supports nav_msgs/Odometry, geometry_msgs/PoseStamped and sensor_msgs/Imu messages as input.
    The resulting transform is divided into three subtransforms with intermediate frames for the footprint and the stabilized base frame (without roll and pitch).'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
