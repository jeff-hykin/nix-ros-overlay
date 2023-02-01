
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, roslaunch, rostest, sensor-msgs, std-msgs, std-srvs, tf, topic-tools }:
buildRosPackage {
  pname = "ros-noetic-openzen-sensor";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "openzen_sensor-release";
    rev = "9234702ac923b979a8f127f2c72ab12b3215653a";
    owner = "lp-research";
    sha256 = "sha256-cywFqPpxCyoovfWUGDFODjiWMGbey98y3cAlR4U9jTA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ roscpp sensor-msgs std-msgs std-srvs tf topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS driver for LP-Research OpenZen'';
    license = with lib.licenses; [ mit "BSL-1.0" lgpl3Only bsdOriginal ];
  };
}
