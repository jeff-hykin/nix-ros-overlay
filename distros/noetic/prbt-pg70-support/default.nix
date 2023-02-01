
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, prbt-ikfast-manipulator-plugin, prbt-moveit-config, prbt-support, schunk-description, xacro }:
buildRosPackage {
  pname = "ros-noetic-prbt-pg70-support";
  version = "0.0.5-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "prbt_grippers-release";
    rev = "6ecc7e9840850fca0adb6e01f09c656061d0f93e";
    owner = "PilzDE";
    sha256 = "sha256-zLVcjlgy5yM7XETklBaRdnyZsXgocUz4x+yboDEBL34=";
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
