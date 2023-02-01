
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, jsoncpp, media-export, qt5, rviz }:
buildRosPackage {
  pname = "ros-noetic-fkie-potree-rviz-plugin";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "potree_rviz_plugin-release";
    rev = "eea4262d40d93cb1622b3f0bfbf8f03aab5856a0";
    owner = "fkie-release";
    sha256 = "sha256-4G64ETXGSge+XUxK5Nd3gs36N0c3skLgmiuXLuPJMgM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin jsoncpp ];
  propagatedBuildInputs = [ boost media-export qt5.qtbase rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Render large point clouds in rviz'';
    license = with lib.licenses; [ asl20 ];
  };
}
