
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-index-python, ament-lint-auto, ament-lint-common, python-qt-binding }:
buildRosPackage {
  pname = "ros-foxy-qt-gui-py-common";
  version = "1.1.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "qt_gui_core-release";
    rev = "dbce0265a24fa633c47c44ab29055036c11f9954";
    owner = "ros2-gbp";
    sha256 = "sha256-QriMiVG1DlnmYXZzo2W2TQL5qiNDcML7s3qW3lW1L8I=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''qt_gui_py_common provides common functionality for GUI plugins written in Python.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
