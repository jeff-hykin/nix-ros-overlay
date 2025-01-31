
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, eigen, message-generation, message-runtime, nav-msgs, roscpp, sensor-msgs, std-msgs, tf, tf2-geometry-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-datmo";
  version = "0.1.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "datmo-release";
    rev = "0a921021e84d65fa6589969d677a6b789bfcec74";
    owner = "kostaskonkk";
    sha256 = "sha256-Mrfo0zFMz/LerjHW+Uh0/ievRlAaHjdThg5oYNX5iwc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules eigen message-generation nav-msgs sensor-msgs tf tf2-geometry-msgs visualization-msgs ];
  propagatedBuildInputs = [ message-runtime roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The LIDAR Detection and Tracking of Moving Objects package'';
    license = with lib.licenses; [ bsdOriginal mit ];
  };
}
