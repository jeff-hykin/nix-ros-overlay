
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, action-msgs, ament-cmake, ament-cmake-core, ament-lint-auto, ament-lint-common, rosidl-core-generators }:
buildRosPackage {
  pname = "ros-rolling-rosidl-default-generators";
  version = "1.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosidl_defaults-release";
    rev = "3800607f9c2f4f19726b4529fd26f6f470aa707c";
    owner = "ros2-gbp";
    sha256 = "sha256-LLXS4Kmu4Mzu0Fksz4W/iTtiNeabFXAVgElRFi7yfBk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ action-msgs ament-cmake-core rosidl-core-generators ];
  nativeBuildInputs = [ action-msgs ament-cmake ament-cmake-core rosidl-core-generators ];

  meta = {
    description = ''A configuration package defining the default ROS interface generators.'';
    license = with lib.licenses; [ asl20 ];
  };
}
