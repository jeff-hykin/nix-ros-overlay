
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-calibration-parsers, catkin, diagnostic-updater, driver-base, dynamic-reconfigure, image-transport, message-generation, message-runtime, roscpp, rospy, rostest, self-test, sensor-msgs, std-msgs, timestamp-tools }:
buildRosPackage {
  pname = "ros-melodic-wge100-camera";
  version = "1.8.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "wge100_driver-release";
    rev = "52129177525d98268a3e6e34e01eb9c6bc1cdb5d";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-xBn8w/h38GhE+1Ccq0PTT3DncrPDmO19B+QCVv50sg8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation rostest ];
  propagatedBuildInputs = [ camera-calibration-parsers diagnostic-updater driver-base dynamic-reconfigure image-transport message-runtime roscpp rospy self-test sensor-msgs std-msgs timestamp-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ROS node and assorted tools to provide access to the WGE100
    camera used in the forearms and the stereo cameras of the PR2
    robot.'';
    license = with lib.licenses; [ "GPL-because-of-list.h-&-other-files-released-under-BSD" ];
  };
}
