
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-wireless-msgs";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "wireless-release";
    rev = "006ed044722415191624a8c692f1bfdaee752143";
    owner = "clearpath-gbp";
    sha256 = "sha256-TZJIhudGUEey1U/FfWaRu/ON7O4eZY8zACqCPRJNeYk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages for describing a wireless network such as bitrate, essid, and link quality.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
