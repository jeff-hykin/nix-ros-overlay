
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, industrial-deprecated, industrial-msgs, industrial-robot-client, industrial-robot-simulator, industrial-trajectory-filters, industrial-utils, simple-message }:
buildRosPackage {
  pname = "ros-noetic-industrial-core";
  version = "0.7.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "industrial_core-release";
    rev = "c80124284b89f04f998a2cc091f2d1b44ede2c06";
    owner = "ros-industrial-release";
    sha256 = "sha256-ZaZnIom8Fvoem61kUwEJL/xy/b8U8ZAxJoZV6J+zOkE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ industrial-deprecated industrial-msgs industrial-robot-client industrial-robot-simulator industrial-trajectory-filters industrial-utils simple-message ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS-Industrial core stack contains packages and libraries for supporing industrial systems'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
