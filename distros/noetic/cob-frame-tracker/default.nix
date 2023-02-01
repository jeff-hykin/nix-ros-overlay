
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, boost, catkin, cob-srvs, control-toolbox, dynamic-reconfigure, geometry-msgs, interactive-markers, kdl-conversions, kdl-parser, message-generation, message-runtime, orocos-kdl, roscpp, roslint, rospy, sensor-msgs, std-msgs, std-srvs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-cob-frame-tracker";
  version = "0.8.20-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_control-release";
    rev = "a3b7c0c1b8b630b864596c74a0330a03efa9b35c";
    owner = "ipa320";
    sha256 = "sha256-cdVtnN2IxsKIrFtOidmx2rDyWTAoQsw159dZoiztC48=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib actionlib-msgs boost cob-srvs control-toolbox dynamic-reconfigure geometry-msgs interactive-markers kdl-conversions kdl-parser message-runtime orocos-kdl roscpp roslint rospy sensor-msgs std-msgs std-srvs tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The cob_frame_tracker package contains nodes that publish Twist commands based on the distance to the desired tf frame target.'';
    license = with lib.licenses; [ asl20 ];
  };
}
