
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-info-manager, catkin, cv-bridge, geometry-msgs, image-transport, message-generation, message-runtime, nodelet, roscpp, sensor-msgs, std-msgs, tf }:
buildRosPackage {
  pname = "ros-noetic-stag-ros";
  version = "0.3.9-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "stag_ros-release";
    rev = "a8e4c41f104c3f7680779671c2c3801adb30b38a";
    owner = "usrl-uofsc";
    sha256 = "sha256-X4HySzTU+463mekd2MhZKaPZc7jk5jiejYX9ZQ4YEpQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge geometry-msgs image-transport message-generation message-runtime nodelet roscpp sensor-msgs std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The stag_ros package'';
    license = with lib.licenses; [ mit ];
  };
}
