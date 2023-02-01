
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diffbot-base, diffbot-bringup, diffbot-control, diffbot-description, diffbot-gazebo, diffbot-navigation }:
buildRosPackage {
  pname = "ros-noetic-diffbot-robot";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "diffbot-release";
    rev = "717cdf3812803e01f447bd86aed1c51bfda4b1cb";
    owner = "ros-mobile-robots-release";
    sha256 = "sha256-EM2zhRUCrfaG7+lZPz3NUfYrrWvj4u7SUyx8UxxKNRs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diffbot-base diffbot-bringup diffbot-control diffbot-description diffbot-gazebo diffbot-navigation ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The diffbot_robot package'';
    license = with lib.licenses; [ "BSDv3" ];
  };
}
