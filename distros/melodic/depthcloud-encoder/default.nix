
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, image-transport, message-filters, pcl-conversions, pcl-ros, roscpp, sensor-msgs, tf-conversions }:
buildRosPackage {
  pname = "ros-melodic-depthcloud-encoder";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "depthcloud_encoder-release";
    rev = "f016fa054dad892a70da2bbda395e3c422afc9f4";
    owner = "RobotWebTools-release";
    sha256 = "sha256-3DoHDLnNEC3hOiOEpTqH8T/rcSvbzKcoZ58na41a5X4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure image-transport message-filters pcl-conversions pcl-ros roscpp sensor-msgs tf-conversions ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Point Cloud Encoder for Web-Based Streaming'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
