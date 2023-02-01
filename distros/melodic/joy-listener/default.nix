
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roslint, rospy, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-joy-listener";
  version = "0.2.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "wu_ros_tools";
    rev = "df8adcb32abb27cab059760a667c55adc7fc8d77";
    owner = "wu-robotics";
    sha256 = "sha256-c93REbjUAhrp1YfHOpbVOmhCu0HBqh/5lm8waHpTw7A=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ rospy sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Translates joy msgs'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
