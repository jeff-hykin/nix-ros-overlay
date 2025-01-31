
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libyamlcpp, roscpp, roslib, rostest }:
buildRosPackage {
  pname = "ros-noetic-sr-hand-detector";
  version = "0.0.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "sr_hand_detector-release";
    rev = "b62ea67d7cb755dea72b57744660538d897b65bf";
    owner = "shadow-robot";
    sha256 = "sha256-swRXG+amquySclSFyf41oEp+AUfPCqvKFX2/tGWcuck=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ libyamlcpp roscpp roslib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The sr_hand_detector package'';
    license = with lib.licenses; [ "GPL" ];
  };
}
