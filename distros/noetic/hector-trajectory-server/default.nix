
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hector-map-tools, hector-nav-msgs, nav-msgs, roscpp, tf }:
buildRosPackage {
  pname = "ros-noetic-hector-trajectory-server";
  version = "0.5.2-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_slam-release";
    rev = "a34db4ad0c8aab8667a1804ba02141557f94943d";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-rRM5FTWC+OC7MdOC/FYeaf82IajgSle/AiDHzzCE9Xk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hector-map-tools hector-nav-msgs nav-msgs roscpp tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_trajectory_server keeps track of tf trajectories extracted from tf data and makes this data accessible via a service and topic.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
