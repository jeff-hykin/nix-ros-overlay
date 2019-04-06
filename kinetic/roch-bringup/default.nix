
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, roch-control, microstrain-3dmgx2-imu, realsense-camera, robot-localization, roch-description, rplidar-ros, rospy, zeroconf-avahi, tf, nmea-navsat-driver, rocon-bubble-icons, pythonPackages, robot-state-publisher, rgbd-launch, depthimage-to-laserscan, roslaunch, imu-filter-madgwick, imu-transformer, roch-safety-controller, catkin, freenect-launch, tf2-ros, roch-capabilities, rocon-app-manager, openni2-launch, astra-launch, nodelet, diagnostic-aggregator, roch-base, rocon-app-manager-msgs, rocon-interaction-msgs, laser-filters, roch-sensorpc, robot-upstart, nmea-comms }:
buildRosPackage {
  pname = "ros-kinetic-roch-bringup";
  version = "2.0.15";

  src = fetchurl {
    url = https://github.com/SawYerRobotics-release/roch_robot-release/archive/release/kinetic/roch_bringup/2.0.15-0.tar.gz;
    sha256 = "39a0f64bc0d30b4fd57b7bd086a138ce5171c1b97ed3cefda84c9370740ea509";
  };

  propagatedBuildInputs = [ roch-control microstrain-3dmgx2-imu roch-safety-controller realsense-camera pythonPackages.scipy freenect-launch tf2-ros robot-localization roch-description rplidar-ros rospy rocon-app-manager openni2-launch astra-launch tf nodelet nmea-comms roch-base roch-capabilities zeroconf-avahi nmea-navsat-driver robot-upstart rocon-bubble-icons rocon-app-manager-msgs rocon-interaction-msgs laser-filters roch-sensorpc robot-state-publisher rgbd-launch depthimage-to-laserscan imu-filter-madgwick imu-transformer diagnostic-aggregator ];
  nativeBuildInputs = [ roslaunch catkin rospy ];

  meta = {
    description = ''SawYer roch installation and integration package'';
    #license = lib.licenses.BSD;
  };
}