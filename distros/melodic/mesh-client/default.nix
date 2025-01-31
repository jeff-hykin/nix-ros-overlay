
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, curl, eigen, jsoncpp, lvr2, pkg-config, roscpp }:
buildRosPackage {
  pname = "ros-melodic-mesh-client";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mesh_navigation-release";
    rev = "cbce908ef4b6d2400f543ba39c4c5e0e1f7af5eb";
    owner = "uos-gbp";
    sha256 = "sha256-ivpJEfNTKMdvaeUo5BALd3xWgS0VqU91/yt6q924w3U=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pkg-config ];
  propagatedBuildInputs = [ curl eigen jsoncpp lvr2 roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The mesh_client package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
