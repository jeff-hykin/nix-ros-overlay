
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, fadecandy-msgs, libusb1, roscpp, rospy }:
buildRosPackage {
  pname = "ros-melodic-fadecandy-driver";
  version = "0.2.1-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "iron-ox";
        repo = "fadecandy_ros-release";
        rev = "release/melodic/fadecandy_driver/0.2.1-1";
        sha256 = "sha256-hnro2O+OnfaIdf+wghsY5pNHufwMxF3e4POTSljDKO0=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rospy ];
  propagatedBuildInputs = [ diagnostic-updater fadecandy-msgs libusb1 roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS driver for fadecandy LED controllers'';
    license = with lib.licenses; [ asl20 ];
  };
}
