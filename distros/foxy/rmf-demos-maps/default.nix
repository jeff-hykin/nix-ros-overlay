
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, rmf-building-map-tools, ros2run }:
buildRosPackage {
  pname = "ros-foxy-rmf-demos-maps";
  version = "1.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_demos-release";
    rev = "c742b08dccd648f1efafed399337363d3c4781b1";
    owner = "ros2-gbp";
    sha256 = "sha256-823ZU+iONSYdP0ZIu+xUHU1o3qynjuJqEklbLNtjXNg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  nativeBuildInputs = [ ament-cmake rmf-building-map-tools ros2run ];

  meta = {
    description = ''A package containing demo maps for rmf'';
    license = with lib.licenses; [ asl20 ];
  };
}
