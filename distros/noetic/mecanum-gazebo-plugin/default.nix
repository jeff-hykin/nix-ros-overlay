
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo, rosconsole, roslint }:
buildRosPackage {
  pname = "ros-noetic-mecanum-gazebo-plugin";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ridgeback_simulator-release";
    rev = "bf54daf1f59f9757bf6bf93a5c4e18593440eadc";
    owner = "clearpath-gbp";
    sha256 = "sha256-EOxUHcg1yURA8LURPBDkU8X6XKdYDVwW7BUoxh77Vww=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  propagatedBuildInputs = [ gazebo rosconsole ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Plugin which uses directional friction to simulate mecanum wheels.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
