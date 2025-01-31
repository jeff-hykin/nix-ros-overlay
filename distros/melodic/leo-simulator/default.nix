
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, leo-gazebo }:
buildRosPackage {
  pname = "ros-melodic-leo-simulator";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leo_simulator-release";
    rev = "fd274a1e3bff9ef3c27ddd3aaf0e20219b49ba4e";
    owner = "fictionlab-gbp";
    sha256 = "sha256-+2kj9GrqfZLE9qAC8yohtxbojuDPSFAzJg6IwW2TUvs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ leo-gazebo ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage of software for simulating Leo Rover'';
    license = with lib.licenses; [ mit ];
  };
}
