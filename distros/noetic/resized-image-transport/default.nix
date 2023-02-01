
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, image-transport, jsk-recognition-utils, jsk-tools, jsk-topic-tools, message-generation, message-runtime, nodelet, rostest, sensor-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-noetic-resized-image-transport";
  version = "1.2.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_recognition-release";
    rev = "c46bcc342f9f9b426f4aebf28c8f04378c56a391";
    owner = "tork-a";
    sha256 = "sha256-RJV5zmMTKiygVxeQObnXK4bn4Iu2PoRrCwu58yVo9GE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  checkInputs = [ jsk-recognition-utils jsk-tools rostest ];
  propagatedBuildInputs = [ cv-bridge image-transport jsk-topic-tools message-runtime nodelet sensor-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS nodes to publish resized images.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
