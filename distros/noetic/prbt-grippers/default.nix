
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, prbt-pg70-support }:
buildRosPackage {
  pname = "ros-noetic-prbt-grippers";
  version = "0.0.5-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "prbt_grippers-release";
    rev = "0d81ab3422b586554250de1c2c0806d29a98056f";
    owner = "PilzDE";
    sha256 = "sha256-fLyHAnipXvJrwYHBE8HPkAkyi/It9eLmqujUnrGU4X4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ prbt-pg70-support ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The package provides gripper support for the pilz_robots package.'';
    license = with lib.licenses; [ asl20 ];
  };
}
