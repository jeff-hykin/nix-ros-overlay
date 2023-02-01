
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, ecl-threads, geometry-msgs, nav-msgs, nodelet, pluginlib, roscpp }:
buildRosPackage {
  pname = "ros-melodic-yocs-velocity-smoother";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "0a57806f367ebaa19e88a05e729e11077a3ec1b4";
    owner = "yujinrobot-release";
    sha256 = "sha256-OMA0Wrmj1syv9GHsCZ2CM6thsLlMkBNH/SuA642PtnE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure ecl-threads geometry-msgs nav-msgs nodelet pluginlib roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Bound incoming velocity messages according to robot velocity and acceleration limits.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
