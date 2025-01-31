
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, diagnostic-msgs, diagnostic-updater, gps-common, libpcap, nav-msgs, nodelet, novatel-gps-msgs, roscpp, sensor-msgs, std-msgs, swri-math-util, swri-nodelet, swri-roscpp, swri-serial-util, swri-string-util, tf }:
buildRosPackage {
  pname = "ros-noetic-novatel-gps-driver";
  version = "3.9.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "novatel_gps_driver-release";
    rev = "bfdfd140fb970e7b3b3aa5eb00f86c9366be81f0";
    owner = "swri-robotics-gbp";
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
