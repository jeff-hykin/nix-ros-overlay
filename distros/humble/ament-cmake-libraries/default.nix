
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core }:
buildRosPackage {
  pname = "ros-humble-ament-cmake-libraries";
  version = "1.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_cmake-release";
    rev = "75c5ae375cda3eec233ba263b04985825abf5e1b";
    owner = "ros2-gbp";
    sha256 = "sha256-KRYSAFQ5QAY/GEty9Hhkb4aZ/h7lokvOdN6H0b1ZIeI=";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ ament-cmake-core ];
  nativeBuildInputs = [ ament-cmake-core ];

  meta = {
    description = ''The functionality to deduplicate libraries in the ament buildsystem in CMake.'';
    license = with lib.licenses; [ asl20 ];
  };
}
