
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, image-publisher, rosbridge-server, rostest, roswww, rviz, rwt-utils-3rdparty, web-video-server }:
buildRosPackage {
  pname = "ros-noetic-rwt-steer";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "7b328acf30564a96334d22fa7c03d9ae8a0ad863";
    owner = "tork-a";
    sha256 = "sha256-ZBqPWxC1EzA1fHOJQwAn5/WWVxjVHYWqeuIiAul0iKg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ image-publisher rostest rviz ];
  propagatedBuildInputs = [ rosbridge-server roswww rwt-utils-3rdparty web-video-server ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rwt_steer package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
