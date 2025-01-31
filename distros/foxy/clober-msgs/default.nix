
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, rosidl-default-generators, rosidl-default-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-clober-msgs";
  version = "0.1.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "clober_msgs_ros2-release";
    rev = "8dedcaecec12596cb9f2dddcbd4e6028f8afdbfa";
    owner = "CLOBOT-Co-Ltd-release";
    sha256 = "sha256-OxFW6Zlr+lUFj9TJAhmVbbs4H5Ka3X0A/7ohbv679N4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''clober robot standard messages'';
    license = with lib.licenses; [ asl20 ];
  };
}
