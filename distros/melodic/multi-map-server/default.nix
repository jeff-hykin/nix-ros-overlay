
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, SDL_image, catkin, jsk-tools, libyamlcpp, map-server, nav-msgs, pythonPackages, rosconsole, roscpp, rosmake, rospy, tf }:
buildRosPackage {
  pname = "ros-melodic-multi-map-server";
  version = "2.2.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_common-release";
    rev = "082bf3ab95411100678836839e3fe150b563c57c";
    owner = "tork-a";
    sha256 = "sha256-e0aYLRc1kI+gHkjBn9uy+l6RrVim+ePXD+pJDLdDYNU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin jsk-tools pythonPackages.pillow pythonPackages.pyyaml rosmake ];
  propagatedBuildInputs = [ SDL_image libyamlcpp map-server nav-msgs rosconsole roscpp rospy tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''multi_map_server provides the'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
