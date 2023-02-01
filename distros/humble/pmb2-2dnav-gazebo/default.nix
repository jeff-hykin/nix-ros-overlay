
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, ament-lint-auto, ament-lint-common, launch-pal, pmb2-2dnav, pmb2-gazebo }:
buildRosPackage {
  pname = "ros-humble-pmb2-2dnav-gazebo";
  version = "3.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pmb2_simulation-gbp";
    rev = "de1c8864b3da482a53ab94f44f916e56e22ca6b9";
    owner = "pal-gbp";
    sha256 = "sha256-3bn9FyAOiHS6/atwys3FVwYaURK53vdgrK/idI+5c7s=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ launch-pal pmb2-2dnav pmb2-gazebo ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''PMB2-specific launch files needed to run
    navigation on the PMB2 robot.'';
    license = with lib.licenses; [ asl20 ];
  };
}
