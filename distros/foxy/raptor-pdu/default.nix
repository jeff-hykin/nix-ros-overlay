
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, ament-lint-auto, ament-lint-common, can-dbc-parser, can-msgs, raptor-pdu-msgs, rclcpp, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-raptor-pdu";
  version = "1.2.0-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "NewEagleRaptor";
        repo = "raptor-dbw-ros2-release";
        rev = "release/foxy/raptor_pdu/1.2.0-1";
        sha256 = "sha256-ALysAodsOryqZ/sy7pzKeJkBs+diuNL31aj3ysV0VoI=";
      };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ can-dbc-parser can-msgs raptor-pdu-msgs rclcpp std-msgs ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''Interface for the New Eagle Multiplex Power Distribution Module (MPDM)
    https://store.neweagle.net/product/multiplexed-power-distribution-module-mpdm/'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
