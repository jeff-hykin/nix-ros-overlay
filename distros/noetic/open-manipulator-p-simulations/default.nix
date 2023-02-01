
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, open-manipulator-p-gazebo }:
buildRosPackage {
  pname = "ros-noetic-open-manipulator-p-simulations";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_manipulator_p_simulations-release";
    rev = "c935641a1b311ffc412235b4ab769271ab38e80d";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-+jZcd6g+V9uZ0HAQEtXXDcdOhyEhKjQxWeIt6O5pQSs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ open-manipulator-p-gazebo ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage for OpenMANIPULATOR-P Simulations'';
    license = with lib.licenses; [ asl20 ];
  };
}
