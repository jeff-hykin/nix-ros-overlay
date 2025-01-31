
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, image-publisher, map-server, move-base-msgs, rosbridge-server, roscpp, rostest, roswww, rviz, rwt-utils-3rdparty, tf, web-video-server }:
buildRosPackage {
  pname = "ros-melodic-rwt-nav";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "869f72ad3727cde06083644cbdb561de108ab6c5";
    owner = "tork-a";
    sha256 = "sha256-k9qDFDmF82YPdc12pyl6h/38aiqrpnfSkVAKCprsZGk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ image-publisher map-server move-base-msgs rostest rviz ];
  propagatedBuildInputs = [ geometry-msgs rosbridge-server roscpp roswww rwt-utils-3rdparty tf web-video-server ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rwt_nav package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
