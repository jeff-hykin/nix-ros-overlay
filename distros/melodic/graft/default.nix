
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, dynamic-reconfigure, eigen, geometry-msgs, message-generation, message-runtime, nav-msgs, rosconsole, roscpp, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-graft";
  version = "0.2.3-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "graft-release";
    rev = "adccb4c5b48be9c05eb1a315fd6df1775dbd999e";
    owner = "ros-gbp";
    sha256 = "sha256-iptW0ogmMJY4rrW2fbaDEO+ZC/+ZS4Nx1KvnUlQADaE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules eigen message-generation ];
  propagatedBuildInputs = [ dynamic-reconfigure geometry-msgs message-runtime nav-msgs rosconsole roscpp sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Graft is not yet finished. It's intended to be a full replacement to
    robot_pose_ekf, including native absolute references, and arbitrary
    topic configuration.

    If you try to use Graft now, please note that not all parameters are
    configured and you will not always see a change in behavior by
    modifying the parameters.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
