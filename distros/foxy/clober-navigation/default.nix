
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common }:
buildRosPackage {
  pname = "ros-foxy-clober-navigation";
  version = "0.2.0-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "clober_ros2-release";
    rev = "3c9b050f9624da9c06ec593e4e31d71294aff109";
    owner = "CLOBOT-Co-Ltd-release";
    sha256 = "sha256-ZdLuXqdD45Ry+f4bk7WWvfkf+z2LAyT0jZrvQpmRojk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''clober navigation packages'';
    license = with lib.licenses; [ asl20 ];
  };
}
