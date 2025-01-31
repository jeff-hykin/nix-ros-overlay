
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-noetic-hector-imu-attitude-to-tf";
  version = "0.5.2-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_slam-release";
    rev = "fc564b3f4b5d35cd804d89300a721ffec3224408";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-KpUpSqxix5PktXCW5nb7FSW4+PVD4WWmB1a8FxDglM0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_imu_attitude_to_tf is a lightweight node that can be used to publish the roll/pitch attitude angles reported via a imu message to tf.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
