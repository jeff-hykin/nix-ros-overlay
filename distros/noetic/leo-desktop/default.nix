
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, leo, leo-viz }:
buildRosPackage {
  pname = "ros-noetic-leo-desktop";
  version = "0.2.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leo_desktop-release";
    rev = "5435dc586fc6591662fb98ce67576330f4c3247f";
    owner = "fictionlab-gbp";
    sha256 = "sha256-GBIA8oy/0NvsPVdCdDI3/fme7gfNQoWVZqp+zzX/aMY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ leo leo-viz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage of software for operating Leo Rover from ROS desktop'';
    license = with lib.licenses; [ mit ];
  };
}
