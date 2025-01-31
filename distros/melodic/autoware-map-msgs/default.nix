
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-autoware-map-msgs";
  version = "1.14.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "messages-release";
    rev = "7f490d442a37739e8ca4761424d61100bba296cd";
    owner = "autoware-ai";
    sha256 = "sha256-RZDcJO2vJJLEolC+3+XSRwT5Snm7bjNGSsAoE0do4xY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Includes messages to handle each class in Autoware Map Format'';
    license = with lib.licenses; [ asl20 ];
  };
}
