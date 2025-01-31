
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-md49-messages";
  version = "0.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "md49_base_controller-release";
    rev = "3b365ce9a444576c136148e347393c2f9c1e8787";
    owner = "Scheik";
    sha256 = "sha256-StjIYxpfsqZwQYebL4hkd2o8HIVNlwqpaO63AB1tNVI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The md49_messages package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
