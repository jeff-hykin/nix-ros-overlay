
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, diagnostic-updater, dynamic-reconfigure, message-generation, message-runtime, roscpp, rospy, rostest, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-jsk-network-tools";
  version = "2.2.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_common-release";
    rev = "fc46a431f00091b6168bacff047ef8e047b41e53";
    owner = "tork-a";
    sha256 = "sha256-5syw3GvBtwT+SoBMPN63X2RLJcMOIXKHwfVXfJxP3FM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation rostest ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater dynamic-reconfigure message-runtime roscpp rospy sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''jsk_network_tools'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
