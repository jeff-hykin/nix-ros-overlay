
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, image-transport, message-generation, message-runtime, roscpp, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-polled-camera";
  version = "1.12.0-r1";

  src = fetchurl {
    url = "https://github.com/ros-gbp/image_common-release/archive/97b80c9dfb3b3d198082b17beb25d99bcdfc01f7.tar.gz";
    name = "1.12.0-1.tar.gz";
    sha256 = "9g195MQsPHHCpV+u/K2p0jsTUYu88+Awba0kmU0aJ98"; # 9g195MQsPHHCpV+u/K2p0jsTUYu88+Awba0kmU0aJ98
  };
    #   specified: sha256-NcGy/xsp8SfWIetFmw+F7jHZFoQ7uclVfBrZ6vZQqj0=
        # got:     sha256-9g195MQsPHHCpV+u/K2p0jsTUYu88+Awba0kmU0aJ98=

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ image-transport message-runtime roscpp sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''polled_camera contains a service and C++ helper classes for implementing a polled
     camera driver node and requesting images from it. The package is currently for
     internal use as the API is still under development.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
