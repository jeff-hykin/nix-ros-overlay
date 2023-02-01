
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, sensor-msgs, std-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-fiducial-msgs";
  version = "0.11.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fiducials-release";
    rev = "9ad5182a89de4514bb1d95c02fd3c418f40ac944";
    owner = "UbiquityRobotics-release";
    sha256 = "sha256-4bgYnfHapkrXRyXNo2SSpGuWbKPctbdVscBz7ZuxiIU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime sensor-msgs std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package containing message definitions for fiducials'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
