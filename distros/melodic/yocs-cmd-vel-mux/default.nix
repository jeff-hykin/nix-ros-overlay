
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, geometry-msgs, libyamlcpp, nodelet, pluginlib, roscpp }:
buildRosPackage {
  pname = "ros-melodic-yocs-cmd-vel-mux";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "0ba2a596fd9a7a9cd6e17500178c1accc9ee3db4";
    owner = "yujinrobot-release";
    sha256 = "sha256-0p5eigiL/G/rn+aNHN3y3JTMhrQn1hCapYHcsZTDyNg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure geometry-msgs libyamlcpp nodelet pluginlib roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A multiplexer for command velocity inputs. Arbitrates incoming cmd_vel messages from several topics,
     allowing one topic at a time to command the robot, based on priorities. It also deallocates current
     allowed topic if no messages are received after a configured timeout. All topics, together with their
     priority and timeout are configured through a YAML file, that can be reload at runtime.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
