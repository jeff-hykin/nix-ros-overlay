
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, mrp2-bringup, mrp2-display, mrp2-hardware }:
buildRosPackage {
  pname = "ros-melodic-mrp2-robot";
  version = "0.2.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrp2_robot-release";
    rev = "5238f8320f037f3dd38d49f280ef363e5fa1e82b";
    owner = "milvusrobotics";
    sha256 = "sha256-ZdqT8Mb4kz89CLB9bXBKFuzwDBX3rsHsrjrYZLmg4FI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ mrp2-bringup mrp2-display mrp2-hardware ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''MRP2 robot description and launch files'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
