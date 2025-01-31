
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-nav2d-msgs";
  version = "0.4.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_2d-release";
    rev = "5bb4d65734e7e435e1785fb431b9f015aad58168";
    owner = "skasperski";
    sha256 = "sha256-crHJFtKYp3KQygnjODSqNpIggGHY1f3iCo03Q1764d0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages used for 2D-Navigation.'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
