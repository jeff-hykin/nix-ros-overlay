
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo, gazebo-ros, gazebo_11, geometry-msgs, message-runtime, nav-msgs, roscpp, std-msgs, std-srvs, tf }:
buildRosPackage {
  pname = "ros-noetic-ridgeback-gazebo-plugins";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ridgeback_simulator-release";
    rev = "c5b824827f96084defa192f0270cf61ddc04ccd5";
    owner = "clearpath-gbp";
    sha256 = "sha256-32Wr2O9lkaCZQvPOUcUdmPqcw5KKJ1bgfaXHBcAt9pU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin gazebo_11 std-srvs ];
  propagatedBuildInputs = [ gazebo gazebo-ros geometry-msgs message-runtime nav-msgs roscpp std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A fork of hector_gazebo_plugins to provide the ros_force_based_move plugin.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
