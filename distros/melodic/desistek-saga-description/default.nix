
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros, robot-state-publisher, rostest, rosunit, uuv-assistants, uuv-descriptions, uuv-gazebo-ros-plugins, uuv-sensor-ros-plugins, xacro }:
buildRosPackage {
  pname = "ros-melodic-desistek-saga-description";
  version = "0.3.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "desistek_saga-release";
    rev = "e36fcd718a8bc41c561c6b55b35f1730a5ee3051";
    owner = "uuvsimulator";
    sha256 = "sha256-+tIUdWPSN40AxeFet2FdDqJ96MwExQo4UufUYDZMFj8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest rosunit xacro ];
  propagatedBuildInputs = [ gazebo-ros robot-state-publisher uuv-assistants uuv-descriptions uuv-gazebo-ros-plugins uuv-sensor-ros-plugins ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The robot description files for the Desistek SAGA ROV underwater vehicle'';
    license = with lib.licenses; [ asl20 ];
  };
}
