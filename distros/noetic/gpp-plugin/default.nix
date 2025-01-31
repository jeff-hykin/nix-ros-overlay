
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, costmap-2d, global-planner, gpp-interface, mbf-costmap-core, mbf-costmap-nav, mbf-msgs, move-base, nav-core, pluginlib, rostest, xmlrpcpp }:
buildRosPackage {
  pname = "ros-noetic-gpp-plugin";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gpp-release";
    rev = "64e2f297b144be7836be9b87a1ebb75717264ff2";
    owner = "dorezyuk";
    sha256 = "sha256-shjIZJpXhUIKXeaiMt84kSWzQmDAFdEB022vQxVAoeo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ global-planner mbf-costmap-nav move-base rostest ];
  propagatedBuildInputs = [ costmap-2d gpp-interface mbf-costmap-core mbf-msgs nav-core pluginlib xmlrpcpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The gpp_plugin package offers a pipeline for running global 
  planners together with auxiliary pre- and post-processing functions'';
    license = with lib.licenses; [ mit ];
  };
}
