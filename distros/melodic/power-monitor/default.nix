
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, pr2-msgs, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-power-monitor";
  version = "1.1.7";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_power_drivers-release";
    rev = "6cb1923c18d59fadc5aaba1fffb1503e84188738";
    owner = "pr2-gbp";
    sha256 = "sha256-MzmSvODkWm+b4JxRXo/UoyDL2HfUeajpHZRDh6DKCo8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure pr2-msgs roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The power_monitor collects messages from the ocean_battery_server and
     the pr2_power_board, and publishes a summary of their data in a
     friendlier message format.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
