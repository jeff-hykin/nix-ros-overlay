
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-webkit-dependency";
  version = "1.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "webkit_dependency-release";
    rev = "e3311f7d28fb36a92459850d3b4cb2495dd3da29";
    owner = "ros-gbp";
    sha256 = "sha256-EQorv4sv/h7CBEYdsR+bw1fHoJX8Nhk0yyMxOct57cU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ python3Packages.pyqt5_with_qtwebkit ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This encapsulates the WebKit dependency for a specific ROS distribution and its Qt version'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
