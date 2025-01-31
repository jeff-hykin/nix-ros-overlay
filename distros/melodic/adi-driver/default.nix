
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, imu-filter-madgwick, roscpp, roslaunch, roslint, rostest, rqt-plot, rviz, rviz-imu-plugin, sensor-msgs, std-srvs, xacro }:
buildRosPackage {
  pname = "ros-melodic-adi-driver";
  version = "1.0.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "adi_driver-release";
    rev = "246346cc84b14d992ff426e65a944678874b93cd";
    owner = "tork-a";
    sha256 = "sha256-eYVgBCUyp5Zqz3lv84kv8goFGGAL+4FK1/oS+bSxxBk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ imu-filter-madgwick roscpp rqt-plot rviz rviz-imu-plugin sensor-msgs std-srvs xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The adi_driver package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
