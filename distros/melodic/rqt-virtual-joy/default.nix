
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rospy, rqt-gui, rqt-gui-py, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rqt-virtual-joy";
  version = "0.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_virtual_joystick-release";
    rev = "65681359d09c212b8acd63fd4a4ac1e19922a9bc";
    owner = "aquahika";
    sha256 = "sha256-oZ+qprSY4weP4utYHXHqzdF9NMHLwatZfx+85jWBwaE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rospy rqt-gui rqt-gui-py sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rqt_virtual_joy package'';
    license = with lib.licenses; [ mit ];
  };
}
