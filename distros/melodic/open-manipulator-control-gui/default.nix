
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, eigen, open-manipulator-msgs, qt5, roscpp, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-open-manipulator-control-gui";
  version = "2.0.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_manipulator-release";
    rev = "cfe30c8f92593bbc4705e5439f05f6466ebfe1a2";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-Ami7rXI0t6SPPXNgeMnJgoS/HSBF/f/LMwfy2t3MKT4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules eigen open-manipulator-msgs qt5.qtbase roscpp sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''OpenManipulator GUI control package based on QT'';
    license = with lib.licenses; [ asl20 ];
  };
}
