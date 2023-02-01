
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libdlib, libntcan, libpcan, libphidgets, opengm }:
buildRosPackage {
  pname = "ros-melodic-cob-extern";
  version = "0.6.17-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_extern-release";
    rev = "d6b7a2562968a5741d70fa771c5240ac4e0ce473";
    owner = "ipa320";
    sha256 = "sha256-VGJDF5L3vH+NDAmHr0DYp5YT8MEj8eNb9YJYxQD7JBo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ libdlib libntcan libpcan libphidgets opengm ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The cob_extern stack contains third party libraries needed for operating Care-O-bot. The packages are downloaded from the manufactorers website and not changed in any way.'';
    license = with lib.licenses; [ "LGPL" "Proprietary" ];
  };
}
