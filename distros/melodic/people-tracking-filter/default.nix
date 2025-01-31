
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, bfl, catkin, geometry-msgs, message-filters, people-msgs, roscpp, roslaunch, roslint, sensor-msgs, std-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-people-tracking-filter";
  version = "1.4.0-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "people-release";
    rev = "85f77f705c4e530732d4182e9b200886dfc9dbc7";
    owner = "OSUrobotics";
    sha256 = "sha256-mITMNrsgbP7qohSushJID/BdNJT5GlPcBpivEhM3/hY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslint ];
  propagatedBuildInputs = [ bfl geometry-msgs message-filters people-msgs roscpp sensor-msgs std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A collection of filtering tools for tracking people's locations'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
