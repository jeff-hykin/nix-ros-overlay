
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, libpcap, libyamlcpp, pcl, pcl-conversions, rclcpp, rslidar-msg, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-galactic-rslidar-sdk";
  version = "1.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rslidar_sdk-release";
    rev = "af7f7cf30d677319bc123a54317122e51c22dc2b";
    owner = "nobleo";
    sha256 = "sha256-MPofBs/szDBuSyjBp8Xu0OwEDNJb76gw5zdhvvI4sqI=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ libpcap libyamlcpp pcl pcl-conversions rclcpp rslidar-msg sensor-msgs std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''The rslidar_sdk package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
