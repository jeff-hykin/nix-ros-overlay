
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, flexbe-msgs, pythonPackages, rospy }:
buildRosPackage {
  pname = "ros-melodic-flexbe-input";
  version = "1.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "flexbe_behavior_engine-release";
    rev = "4ddd71302ddda40a43f4e9691cae6c44d024aceb";
    owner = "FlexBE";
    sha256 = "sha256-d7s3Rg5/scjED5UuXBN4+jbf08+qXoTcmYN0itVunFs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib flexbe-msgs pythonPackages.six rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''flexbe_input enables to send data to onboard behavior when required.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
