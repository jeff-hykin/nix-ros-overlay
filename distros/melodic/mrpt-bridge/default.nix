
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, geometry-msgs, gtest, marker-msgs, message-generation, message-runtime, mrpt-msgs, mrpt2, nav-msgs, pcl, pcl-conversions, qt5, roscpp, rosunit, sensor-msgs, std-msgs, stereo-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-mrpt-bridge";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrpt_bridge-release";
    rev = "22a91301d0223dcdf0155379dad69f208a5a8613";
    owner = "mrpt-ros-pkg-release";
    sha256 = "sha256-9geX7dVwj7I5yWR53I4DtOHTxmwzaP5X4hJ1quh0XLc=";
  };

  buildType = "catkin";
  buildInputs = [ pcl pcl-conversions qt5.qtbase ];
  checkInputs = [ gtest rosunit ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs marker-msgs message-generation message-runtime mrpt-msgs mrpt2 nav-msgs roscpp sensor-msgs std-msgs stereo-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''C++ library to convert between ROS messages and MRPT classes'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
