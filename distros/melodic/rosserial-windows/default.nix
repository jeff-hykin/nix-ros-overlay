
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-runtime, nav-msgs, rospy, rosserial-client, rosserial-msgs, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rosserial-windows";
  version = "0.8.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosserial-release";
    rev = "9d2c9b31ce43c3504efc69fe25bedfc4c908325a";
    owner = "ros-gbp";
    sha256 = "sha256-gp+H7MAJnKrsWQ6+6SNH6Yib7lZIBK4E4AfR7GJWY5s=";
  };

  buildType = "catkin";
  buildInputs = [ catkin geometry-msgs nav-msgs sensor-msgs std-msgs ];
  propagatedBuildInputs = [ message-runtime rospy rosserial-client rosserial-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rosserial for Windows platforms.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
