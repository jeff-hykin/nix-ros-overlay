
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, prbt-ikfast-manipulator-plugin, prbt-moveit-config, prbt-support, schunk-description, xacro }:
buildRosPackage {
  pname = "ros-melodic-prbt-pg70-support";
  version = "0.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "prbt_grippers-release";
    rev = "c45e6fe91a901e4ccd702d6f7467d2b45065c268";
    owner = "PilzDE";
    sha256 = "sha256-CkNS7qydSKc7lkDUnlJ5iAgaQWAuVc2yqI6/Hi8Z0Js=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ prbt-ikfast-manipulator-plugin prbt-moveit-config prbt-support schunk-description xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''PRBT support for Schunk pg70 gripper.'';
    license = with lib.licenses; [ asl20 ];
  };
}
