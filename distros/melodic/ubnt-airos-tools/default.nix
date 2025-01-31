
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, pythonPackages, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-ubnt-airos-tools";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ubnt_airos_tools-release";
    rev = "5503c6d4af58b915fbeb06b90bb1edd0a291a1fe";
    owner = "peci1";
    sha256 = "sha256-01X2oIbDT7wd40s/FWGSF98A9a+t/evhxasiw6Dytvo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime pythonPackages.requests rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Ubiquiti AirOS tools for extracting AP information to ROS'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
