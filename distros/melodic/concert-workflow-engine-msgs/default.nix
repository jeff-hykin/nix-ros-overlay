
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-concert-workflow-engine-msgs";
  version = "0.9.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rocon_msgs-release";
    rev = "1ded2cb2a56014a008d3aef37ce19790e8edcc15";
    owner = "yujinrobot-release";
    sha256 = "sha256-kiKrF8IJOwf1EoKLT0QJGi4iLAjV64Pf6S3iz3Jnmro=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages used by workflow engine'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
