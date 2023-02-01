
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-qt-build";
  version = "0.2.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "qt_ros-release";
    rev = "7c9982eb9898ab1f2e2f72f9376b9e28677ca50a";
    owner = "yujinrobot-release";
    sha256 = "sha256-r3oiMwz3b+7dlO0TPsDtgEE2mpEYkRTjVc6O3W85Uzk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Currently just maintains a cmake api for simplifying the building
    of qt apps within the ros framework.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
