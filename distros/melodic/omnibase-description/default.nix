
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, effort-controllers, geometry-msgs, joint-state-controller, joint-trajectory-controller, position-controllers, roscpp, rospy, std-msgs, velocity-controllers }:
buildRosPackage {
  pname = "ros-melodic-omnibase-description";
  version = "1.0.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "omnibase-release";
    rev = "ce4909023b174c1df28bd2360ac086257b5e4bd8";
    owner = "ERC-BPGC";
    sha256 = "sha256-oeXPDLTnNU5P1WUWHTPgcKa9xgwdK2G9bhZrpm0YmiQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ effort-controllers geometry-msgs joint-state-controller joint-trajectory-controller position-controllers roscpp rospy std-msgs velocity-controllers ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package constains the model files of the omnibase(omniwheeled robot)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
