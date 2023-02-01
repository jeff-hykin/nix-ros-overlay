
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, ament-lint-auto, ament-lint-common, pmb2-2dnav, pmb2-gazebo }:
buildRosPackage {
  pname = "ros-foxy-pmb2-2dnav-gazebo";
  version = "3.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pmb2_simulation-gbp";
    rev = "09ad4e9534bc789600048a54a87cd530adf8987a";
    owner = "pal-gbp";
    sha256 = "sha256-DoILVIWnbep7REpipKXbXnLX85MmV62Qka4AVeIYWGM=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ pmb2-2dnav pmb2-gazebo ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''PMB2-specific launch files needed to run
    navigation on the PMB2 robot.'';
    license = with lib.licenses; [ "Modified-BSD" ];
  };
}
