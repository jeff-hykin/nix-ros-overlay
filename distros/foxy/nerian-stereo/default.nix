
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, cv-bridge, rosidl-default-generators, rosidl-default-runtime, sensor-msgs, std-msgs, stereo-msgs, tf2, tf2-ros }:
buildRosPackage {
  pname = "ros-foxy-nerian-stereo";
  version = "1.1.1-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "nerian-vision";
        repo = "nerian_stereo_ros2-release";
        rev = "release/foxy/nerian_stereo/1.1.1-1";
        sha256 = "sha256-6CoVp+bNN3DR6PXmHMBsHHQjSlUDErcEe1MsKNvOF04=";
      };

  buildType = "ament_cmake";
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ ament-cmake cv-bridge rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs stereo-msgs tf2 tf2-ros ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''Driver node for ROS 2 for Scarlet, SceneScan and SP1 stereo vision sensors by Nerian Vision GmbH'';
    license = with lib.licenses; [ mit ];
  };
}
