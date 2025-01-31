
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, costmap-2d, geometry-msgs }:
buildRosPackage {
  pname = "ros-noetic-gpp-interface";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gpp-release";
    rev = "9ec3844ab70ee13b33cbbc57473dfe40e874e1e8";
    owner = "dorezyuk";
    sha256 = "sha256-e5mF0Lz/FBR78HTAmtqT3LApj3O+V1szSQMVsH2VtEc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ costmap-2d geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The gpp_interface package defines the interfaces for
  pre and post-planning inside the global_planner_pipeline framework'';
    license = with lib.licenses; [ mit ];
  };
}
