
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, nav-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-novatel-msgs";
  version = "1.1.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "novatel_span_driver-release";
    rev = "1585dc7e2f27ca6d00842602c3afd0e20651630c";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-9ls/xG2crJZqGTQY4zIbFGzrrmzfIFHnHr7wIUnf/rE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime nav-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS messages which represent raw Novatel SPAN data.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
