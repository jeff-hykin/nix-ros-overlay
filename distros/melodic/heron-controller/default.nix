
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, control-toolbox, geometry-msgs, heron-msgs, nav-msgs, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-heron-controller";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "heron_controller-release";
    rev = "62bba429aebb078fa35e1683bb7e922305423f30";
    owner = "clearpath-gbp";
    sha256 = "sha256-F4Y1c854HODlkb39Lfw9mmg5mFxgrb6yZSHogKqesjQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ control-toolbox geometry-msgs heron-msgs nav-msgs sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The heron_controller package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
