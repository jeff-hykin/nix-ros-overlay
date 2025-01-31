
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-volta-msgs";
  version = "1.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "volta-release";
    rev = "f93201d95b1ba3a6eae358496042bd911ef15d4e";
    owner = "botsync-gbp";
    sha256 = "sha256-g9bQ0l9lPY3MyON8usWCo9UVX/Av/m41pQ8ScITvIqk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ message-generation std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The volta_msgs package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
