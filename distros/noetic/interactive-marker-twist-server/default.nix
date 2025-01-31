
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, interactive-markers, roscpp, roslaunch, roslint, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-interactive-marker-twist-server";
  version = "1.2.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "interactive_marker_twist_server-release";
    rev = "086791d148f64c1e8344046117ae6c5574ab9423";
    owner = "ros-gbp";
    sha256 = "sha256-JncKemRQ5Bt6lURZB0oSoC57We2g9/ciwhx/PeIXq/U=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslint ];
  propagatedBuildInputs = [ interactive-markers roscpp tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Interactive control for generic Twist-based robots using interactive markers'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
