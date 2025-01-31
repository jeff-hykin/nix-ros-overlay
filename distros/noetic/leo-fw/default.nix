
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, leo-msgs, libyamlcpp, nav-msgs, python3Packages, roscpp, rosgraph, rosmon-msgs, rosnode, rospy, rosservice, sensor-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-noetic-leo-fw";
  version = "2.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leo_robot-release";
    rev = "1b9c1435a6ce8b71b1808bc55b083ad458528d31";
    owner = "fictionlab-gbp";
    sha256 = "sha256-WbWMMP5u+CBYtSRil5nwAWLGRjpNqqboCQpDeAnOxLg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.setuptools ];
  propagatedBuildInputs = [ leo-msgs libyamlcpp nav-msgs python3Packages.numpy python3Packages.rospkg python3Packages.whichcraft roscpp rosgraph rosmon-msgs rosnode rospy rosservice sensor-msgs std-srvs ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''Binary releases of Leo Rover firmware and related utilities'';
    license = with lib.licenses; [ mit ];
  };
}
