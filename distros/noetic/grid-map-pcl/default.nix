
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, grid-map-core, grid-map-msgs, grid-map-ros, gtest, libyamlcpp, pcl, pcl-ros, roscpp }:
buildRosPackage {
  pname = "ros-noetic-grid-map-pcl";
  version = "1.6.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "b6c807381d5dc5075165d5ea66c5aad817a44ea0";
    owner = "anybotics";
    sha256 = "sha256-eayKnOGauHu5czEyFKNz0kUj8FrU0MlMEnMTYgNT8h4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ grid-map-core grid-map-msgs grid-map-ros libyamlcpp pcl pcl-ros roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Conversions between grid maps and Point Cloud Library (PCL) types.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
