
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, control-msgs, geometry-msgs, nav-msgs, roscpp, sensor-msgs, topic-tools }:
buildRosPackage {
  pname = "ros-melodic-fetch-teleop";
  version = "0.8.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fetch_ros-release";
    rev = "a1287d393fdf076e284f68c61962b5fbc77cc980";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-YyoM1LcgG4mN7zUmwSfMRwqpw3E98cYqRRya1xPjqe0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib control-msgs geometry-msgs nav-msgs roscpp sensor-msgs topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Teleoperation for fetch and freight.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
