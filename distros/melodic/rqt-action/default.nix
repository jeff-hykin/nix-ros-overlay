
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rospy, rqt-msg, rqt-py-common }:
buildRosPackage {
  pname = "ros-melodic-rqt-action";
  version = "0.4.9";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_action-release";
    rev = "17de48508b753f5840c14dba129219d604fd1651";
    owner = "ros-gbp";
    sha256 = "sha256-N5GFkG2yNzCE4tWc23uFMGwFk8D7TEUoLddfyC3UxmQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rospy rqt-msg rqt-py-common ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rqt_action provides a feature to introspect all available ROS
  action (from actionlib) types. By utilizing rqt_msg, the output format is
  unified with it and rqt_srv. Note that the actions shown on this plugin
  is the ones that are stored on your machine, not on the ROS core your rqt
  instance connects to.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
