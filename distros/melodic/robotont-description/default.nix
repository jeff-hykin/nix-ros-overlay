
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joint-state-publisher, robot-state-publisher, rviz, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-robotont-description";
  version = "0.0.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robotont_description-release";
    rev = "2cbfea38b21c0ada2cb3c6ff19723f44bb52305c";
    owner = "robotont-release";
    sha256 = "sha256-jT/rmUG7UA79Fx6nxn6Ky5GMlteOcZfwS/vHN6t+ogI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ joint-state-publisher robot-state-publisher rviz urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The robotont_description package'';
    license = with lib.licenses; [ asl20 ];
  };
}
