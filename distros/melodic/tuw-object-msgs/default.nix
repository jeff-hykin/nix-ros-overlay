
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-tuw-object-msgs";
  version = "0.0.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tuw_msgs-release";
    rev = "dd66061038951b3fa58b6196b00ed2bbe0e00d31";
    owner = "tuw-robotics";
    sha256 = "sha256-c6XJfuFxbqSIf0egUIUIysRdmtZL/v9F0dG5E/EZXqc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The tuw_object_msgs package. This pkg provides a set of messages used to detect, map and track objects of different types.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
