
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, image-publisher, message-generation, message-runtime, rosbridge-server, rospy, rostest, roswww, rviz, rwt-utils-3rdparty, std-srvs, web-video-server }:
buildRosPackage {
  pname = "ros-noetic-rwt-image-view";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "9c580df3b077f829a21153a0ec9da546ab5dc1c6";
    owner = "tork-a";
    sha256 = "sha256-Acfcnlp8FhvFUgoTH3qeYFvDWi0kpPNoUSkZo7Gbrts=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  checkInputs = [ image-publisher rostest rviz ];
  propagatedBuildInputs = [ message-runtime rosbridge-server rospy roswww rwt-utils-3rdparty std-srvs web-video-server ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rwt_image_view package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
