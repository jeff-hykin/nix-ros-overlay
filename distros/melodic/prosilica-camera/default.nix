
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-calibration-parsers, catkin, diagnostic-msgs, diagnostic-updater, driver-base, dynamic-reconfigure, image-transport, polled-camera, prosilica-gige-sdk, rosconsole, roscpp, self-test, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-prosilica-camera";
  version = "1.9.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "prosilica_driver-release";
    rev = "2091a5eafb50a1bf2f207cc0b1bd4185f3386da6";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-dFhXCk4FGtfSQk8kvb+pn9DzZRJdJRU7iocGkvWNK9Q=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rosconsole ];
  propagatedBuildInputs = [ camera-calibration-parsers diagnostic-msgs diagnostic-updater driver-base dynamic-reconfigure image-transport polled-camera prosilica-gige-sdk roscpp self-test sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ROS driver node for AVT/Prosilica Gigabit Ethernet (GigE) cameras.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
