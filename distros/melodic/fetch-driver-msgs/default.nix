
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, geometry-msgs, message-generation, message-runtime, power-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-fetch-driver-msgs";
  version = "1.1.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fetch_msgs-release";
    rev = "d516a8c18903e6b73ca705b0dd05d0440746604c";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-3f226jvP42xD5gudw04daHpLqTMUlxppyjviOc2RFpM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib actionlib-msgs geometry-msgs message-runtime power-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages for the fetch_drivers package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
