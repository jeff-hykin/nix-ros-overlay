
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, menge-vendor, qt5, rclcpp, rmf-building-sim-common }:
buildRosPackage {
  pname = "ros-humble-rmf-building-sim-ignition-plugins";
  version = "1.2.0-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_simulation-release";
    rev = "b2040793d9a26db75156f3508d0edc6f22cf2258";
    owner = "ros2-gbp";
    sha256 = "sha256-zq07Zy0WtGCpzlyz1WOqOoBJCG2LvpFaTme9hLWusxw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ menge-vendor qt5.qtbase qt5.qtdeclarative rclcpp rmf-building-sim-common ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Ignition gazebo plugins for building infrastructure simulation'';
    license = with lib.licenses; [ asl20 ];
  };
}
