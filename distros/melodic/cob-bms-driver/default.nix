
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-msgs, cob-srvs, diagnostic-msgs, diagnostic-updater, pythonPackages, roscpp, rospy, socketcan-interface, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-cob-bms-driver";
  version = "0.7.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_driver-release";
    rev = "5944c2deecc7d5546db1cf4075a7463a8a0c17a9";
    owner = "ipa320";
    sha256 = "sha256-5IdDHIUMrtK9KY9lZww1M3hC5jA4Ex9mgaC3Wg0WdxA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-msgs cob-srvs diagnostic-msgs diagnostic-updater pythonPackages.numpy roscpp rospy socketcan-interface std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Driver package for interfacing the battery management system (BMS) on Care-O-bot.'';
    license = with lib.licenses; [ asl20 ];
  };
}
