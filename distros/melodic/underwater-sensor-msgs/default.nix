
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, roscpp, std-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-underwater-sensor-msgs";
  version = "1.4.2-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "underwater_simulation-release";
    rev = "f7c21d05489bdd40ebc2d223632e4c5b14bf2ca7";
    owner = "uji-ros-pkg";
    sha256 = "sha256-6Hy/87ZPdAVSfrPIerkVVerC0PPd2+HMJ6Q/e/ViyGI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime roscpp std-msgs visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Common messages for underwater robotics'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
