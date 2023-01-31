
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, diagnostic-msgs, diagnostic-updater, gps-common, libpcap, nav-msgs, nodelet, novatel-gps-msgs, roscpp, sensor-msgs, std-msgs, swri-math-util, swri-nodelet, swri-roscpp, swri-serial-util, swri-string-util, tf }:
buildRosPackage {
  pname = "ros-melodic-novatel-gps-driver";
  version = "3.9.0-r1";

  src = fetchurl {
    url = "https://github.com/swri-robotics-gbp/novatel_gps_driver-release/archive/fab3371440e2860aa4312daf24341c631541eeaf.tar.gz";
    sha256 = "sha256-L8vDk9aHMXH/KBT6V1EJTvDrkppgG30LjqbvtsfwNyo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost diagnostic-msgs diagnostic-updater gps-common libpcap nav-msgs nodelet novatel-gps-msgs roscpp sensor-msgs std-msgs swri-math-util swri-nodelet swri-roscpp swri-serial-util swri-string-util tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Driver for NovAtel receivers'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
