
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, eigen, geometry-msgs, mav-msgs, message-generation, message-runtime, sensor-msgs, std-msgs, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-mav-planning-msgs";
  version = "3.3.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mav_comm-release";
    rev = "38cccd42948668ced074c0d88d541d7d5689aec0";
    owner = "ethz-asl";
    sha256 = "sha256-eGZXz91lJJOKowupKA3dfR5lwUhQc5i/OFrtO5SC7Eo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules eigen geometry-msgs mav-msgs message-generation message-runtime sensor-msgs std-msgs trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages specific to MAV planning, especially polynomial planning.'';
    license = with lib.licenses; [ "ASL-2.0" ];
  };
}
