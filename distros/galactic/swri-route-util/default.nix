
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, boost, marti-common-msgs, marti-nav-msgs, rclcpp, swri-geometry-util, swri-math-util, swri-roscpp, swri-transform-util, tf2-geometry-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-galactic-swri-route-util";
  version = "3.5.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "marti_common-release";
    rev = "d18190fb125cec58df926b2661dbe446e6b540a3";
    owner = "ros2-gbp";
    sha256 = "sha256-cOdL5x9OxxwwKnc4v2c91ZTknuJipZli6KXzQf3eJWE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ boost marti-common-msgs marti-nav-msgs rclcpp swri-geometry-util swri-math-util swri-roscpp swri-transform-util tf2-geometry-msgs visualization-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''This library provides functionality to simplify working with the
    navigation messages defined in marti_nav_msgs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
