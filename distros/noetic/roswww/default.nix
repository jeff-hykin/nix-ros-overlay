
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages, rosbridge-server, rosgraph, rospack, rostest }:
buildRosPackage {
  pname = "ros-noetic-roswww";
  version = "0.1.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roswww-release";
    rev = "b160ea9fff2713d3cab485d90f35ea55c72ba0bc";
    owner = "ros-gbp";
    sha256 = "sha256-/es7Z0mr7Rhsj4ZaOk8lBfQQvO/Stc4cc4Ros3Or/Rs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.catkin-pkg ];
  checkInputs = [ python3Packages.selenium rostest ];
  propagatedBuildInputs = [ rosbridge-server rosgraph rospack ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Feathery lightweight web server for ROS, that is based on <a href="http://www.tornadoweb.org/en/stable">Tornado</a> web server module.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
