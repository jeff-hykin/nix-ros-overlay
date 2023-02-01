
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joy, pacmod-msgs, roscpp, roslint, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-pacmod-game-control";
  version = "3.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pacmod_game_control-release";
    rev = "b3340ecbd6810a04c7ce509d67ca07d4fdcd2446";
    owner = "astuff";
    sha256 = "sha256-fjmJCHP9ZzgF4eaDQyqRgioCnbm8H0WGXaclaMR0Wpg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  propagatedBuildInputs = [ joy pacmod-msgs roscpp sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS Package for controlling the AStuff PACMod with a Joystick'';
    license = with lib.licenses; [ mit ];
  };
}
