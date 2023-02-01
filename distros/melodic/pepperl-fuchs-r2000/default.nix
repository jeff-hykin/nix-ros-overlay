
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-pepperl-fuchs-r2000";
  version = "0.1.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pepperl_fuchs-release";
    rev = "42866a0b54e9869b575e72c1d1c9531365c9d357";
    owner = "dillenberger";
    sha256 = "sha256-18sfMasHRxV4c33pYtWlcRkfpiqdh0kYuxbuM7hRV9U=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The Pepperl+Fuchs R2000 laser range finder driver package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
