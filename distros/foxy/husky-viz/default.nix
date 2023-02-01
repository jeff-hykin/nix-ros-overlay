
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, husky-description, joint-state-publisher, joint-state-publisher-gui, launch-ros, robot-state-publisher, rviz2 }:
buildRosPackage {
  pname = "ros-foxy-husky-viz";
  version = "1.0.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "husky-release";
    rev = "9bc0fab315b942093a0a9ef4dfb80f5d28190b07";
    owner = "clearpath-gbp";
    sha256 = "sha256-dkEJkgNCRNM/ujJXNN/YmgbNlxHR3uOVEkdVFuMDPv0=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ husky-description joint-state-publisher joint-state-publisher-gui launch-ros robot-state-publisher rviz2 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Visualization configuration for Clearpath Husky'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
