
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ncurses, roscpp, xclip }:
buildRosPackage {
  pname = "ros-melodic-log-view";
  version = "0.1.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "log_view-release";
    rev = "6142448e4e51e9b32746ca4e40c188b7dd354401";
    owner = "hatchbed";
    sha256 = "sha256-aCxYKgynCd7OZqWNJNIBW9TZk5jcCewfyQUTEc1nBP8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ncurses roscpp xclip ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The log_view package provides a ncurses based terminal GUI for
    viewing and filtering published ROS log messages.

    This is an alternative to rqt_console and swri_console that doesn't depend
    on qt and can be run directly in a terminal.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
