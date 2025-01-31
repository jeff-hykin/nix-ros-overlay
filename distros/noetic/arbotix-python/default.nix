
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, arbotix-msgs, catkin, control-msgs, diagnostic-msgs, geometry-msgs, nav-msgs, python3Packages, rospy, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-noetic-arbotix-python";
  version = "0.11.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "arbotix_ros-release";
    rev = "a1aba88dda94d7f36f1247c3c20d537018dad763";
    owner = "vanadiumlabs";
    sha256 = "sha256-PdPE5YjdiKrgVVI1mZB5KAUjqmipV0aAM2mnnqpUii0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib arbotix-msgs control-msgs diagnostic-msgs geometry-msgs nav-msgs python3Packages.pyserial rospy sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Bindings and low-level controllers for ArbotiX-powered robots.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
