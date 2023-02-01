
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, image-transport, libogg, libtheora, message-generation, message-runtime, pluginlib, rosbag, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-theora-image-transport";
  version = "1.9.5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "image_transport_plugins-release";
    rev = "ce1aaacf91a717ea76bf875cf27bd2486227b4ee";
    owner = "ros-gbp";
    sha256 = "sha256-NRn5uF86fC3K9ld3QhqpIg810rvbYVQCs0TCuBSA7g0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure image-transport libogg libtheora message-runtime pluginlib rosbag std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Theora_image_transport provides a plugin to image_transport for
    transparently sending an image stream encoded with the Theora codec.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
