
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libphidget21, phidgets-api, phidgets-high-speed-encoder, phidgets-ik, phidgets-imu, phidgets-msgs }:
buildRosPackage {
  pname = "ros-melodic-phidgets-drivers";
  version = "0.7.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "phidgets_drivers-release";
    rev = "ad907fb339019bc595461bc26d628a038442b26c";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-RL1szAPnVjrxC+zIpWjmQ6pyZsnFux/UYZ8qhppSjt0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ libphidget21 phidgets-api phidgets-high-speed-encoder phidgets-ik phidgets-imu phidgets-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''API and ROS drivers for Phidgets devices'';
    license = with lib.licenses; [ "BSD-&-LGPL" ];
  };
}
