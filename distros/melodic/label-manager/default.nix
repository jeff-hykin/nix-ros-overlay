
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, genmsg, mesh-msgs, message-generation, message-runtime, roscpp, sensor-msgs, std-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-label-manager";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mesh-tools";
    rev = "62fe300fb100755f41e86a87230cfd845b651187";
    owner = "uos-gbp";
    sha256 = "sha256-z4qdRuckd+O/q4Y3ibC6/Fyao0yGI+IZIWVGj2PK/Mk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib actionlib-msgs genmsg mesh-msgs message-generation message-runtime roscpp sensor-msgs std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Serving and persisting label information'';
    license = with lib.licenses; [ bsd3 ];
  };
}
