
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp }:
buildRosPackage {
  pname = "ros-melodic-yocs-controllers";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "be3fe512f459923bbc0b500a5c54cb9287ba4832";
    owner = "yujinrobot-release";
    sha256 = "sha256-5GlDyWCpOrdSGtPiNwLkC8ja53w7CdZZJVP3q5dY6/M=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Library for various controller types and algorithms'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
