
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros, gazebo-video-monitor-msgs, libyamlcpp, opencv, roscpp, std-srvs }:
buildRosPackage {
  pname = "ros-noetic-gazebo-video-monitor-plugins";
  version = "0.7.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gazebo_video_monitors-release";
    rev = "15218a869b6f164264cbf90203d172a4fbc1fb58";
    owner = "nlamprian";
    sha256 = "sha256-zDo0iRuQwCn4ps9KjXOCb4wkBFPHWd8ZyAtfTtvCA9o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin libyamlcpp ];
  propagatedBuildInputs = [ gazebo-ros gazebo-video-monitor-msgs opencv roscpp std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''gazebo_video_monitor_plugins is a package that lets the user record videos of a <a href="http://gazebosim.org/">Gazebo</a> simulation. It provides a multicamera sensor that can be used for creating different types of videos with multiple views from inside the gazebo world. There is a number of plugins already available in the package, but more can be developed by the user, with minimal effort, to fit arbitrary use cases.'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
