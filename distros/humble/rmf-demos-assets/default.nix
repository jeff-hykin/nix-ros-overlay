
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake }:
buildRosPackage {
  pname = "ros-humble-rmf-demos-assets";
  version = "1.3.1-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_demos-release";
    rev = "d12ead0da7541397de7765a6c72ad20da0fd322e";
    owner = "ros2-gbp";
    sha256 = "sha256-YMM3NYbGim/l2i2nzpn8JIBHgVWMuDd3XpLNE16/Rgs=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Models and other media used for RMF demos'';
    license = with lib.licenses; [ asl20 ];
  };
}
