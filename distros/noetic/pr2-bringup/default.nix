
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-aggregator, ethercat-trigger-controllers, imu-monitor, joint-trajectory-action, joy, microstrain-3dmgx2-imu, ocean-battery-driver, power-monitor, pr2-calibration-controllers, pr2-camera-synchronizer, pr2-computer-monitor, pr2-controller-configuration, pr2-controller-manager, pr2-dashboard-aggregator, pr2-description, pr2-ethercat, pr2-gripper-action, pr2-head-action, pr2-machine, pr2-power-board, pr2-run-stop-auto-restart, prosilica-camera, robot-mechanism-controllers, robot-pose-ekf, robot-state-publisher, rosbag, roslaunch, rostest, single-joint-position-action, sound-play, std-srvs, stereo-image-proc, tf2-ros, urg-node, wge100-camera, wifi-ddwrt }:
buildRosPackage {
  pname = "ros-noetic-pr2-bringup";
  version = "1.6.32-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_robot-release";
    rev = "1426a14cabddc363a3d60ee4c3190d4f775201d1";
    owner = "pr2-gbp";
    sha256 = "sha256-Li+vd9Lr/fTAIs7HLqj4goP1TVYdl51ocTWEGgq+T94=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch rostest ];
  propagatedBuildInputs = [ diagnostic-aggregator ethercat-trigger-controllers imu-monitor joint-trajectory-action joy microstrain-3dmgx2-imu ocean-battery-driver power-monitor pr2-calibration-controllers pr2-camera-synchronizer pr2-computer-monitor pr2-controller-configuration pr2-controller-manager pr2-dashboard-aggregator pr2-description pr2-ethercat pr2-gripper-action pr2-head-action pr2-machine pr2-power-board pr2-run-stop-auto-restart prosilica-camera robot-mechanism-controllers robot-pose-ekf robot-state-publisher rosbag single-joint-position-action sound-play std-srvs stereo-image-proc tf2-ros urg-node wge100-camera wifi-ddwrt ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch files and scripts needed to bring a PR2 up into a running state.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
