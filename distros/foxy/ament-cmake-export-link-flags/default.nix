
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core }:
buildRosPackage {
  pname = "ros-foxy-ament-cmake-export-link-flags";
  version = "0.9.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_cmake-release";
    rev = "c58b2ed771907111d84352e30b51884ae4c07749";
    owner = "ros2-gbp";
    sha256 = "sha256-g+9PylAAfXKPsN7zIcIC0JxTmvqINrRj4T9N0/jGFp0=";
  };

  buildType = "ament_cmake";
  propagatedBuildInputs = [ ament-cmake-core ];
  nativeBuildInputs = [ ament-cmake-core ];

  meta = {
    description = ''The ability to export link flags to downstream packages in the ament buildsystem.'';
    license = with lib.licenses; [ asl20 ];
  };
}
