
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, liblapack, moveit-core, pluginlib, roscpp, tf-conversions }:
buildRosPackage {
  pname = "ros-melodic-khi-rs-ikfast-plugin";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "khi_robot-release";
    rev = "36675e5fc75b2cb259a90c16ae731839f053e40e";
    owner = "Kawasaki-Robotics";
    sha256 = "sha256-ZcMgaCsYLH27UT/AtJ5mkNYEu9JHcFue8UEpBixP0K4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ liblapack moveit-core pluginlib roscpp tf-conversions ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The khi_rs_ikfast_plugin package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
