
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosemacs, roslisp, sbcl, slime-wrapper }:
buildRosPackage {
  pname = "ros-noetic-slime-ros";
  version = "0.4.17-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_emacs_utils-release";
    rev = "7dc9cd48603dddd60129fe954cd684ec0b470a8c";
    owner = "code-iai-release";
    sha256 = "sha256-Fb6mw5TgFwQTjAi9hMqX0coIKx6MWWrD0ySKQfN48Hk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rosemacs roslisp sbcl slime-wrapper ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Extensions for slime to assist in working with ROS packages'';
    license = with lib.licenses; [ publicDomain ];
  };
}
