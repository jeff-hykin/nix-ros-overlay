
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, costmap-2d, cv-bridge, dynamic-reconfigure, geometry-msgs, message-generation, message-runtime, pluginlib, roscpp, rostest, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-costmap-converter";
  version = "0.0.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "costmap_converter-release";
    rev = "f79091a5cbcdb7ad1c83d7313166fc4aaba9461f";
    owner = "rst-tu-dortmund";
    sha256 = "sha256-Vcu18wLF3GIxbt0v4bEmWUesm37RR/wRqqFnwPLOAK4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ costmap-2d cv-bridge dynamic-reconfigure geometry-msgs message-runtime pluginlib roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ros package that includes plugins and nodes to convert occupied costmap2d cells to primitive types.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
