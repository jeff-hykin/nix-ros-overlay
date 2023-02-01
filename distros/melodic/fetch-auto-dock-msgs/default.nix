
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, geometry-msgs, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-melodic-fetch-auto-dock-msgs";
  version = "1.1.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fetch_msgs-release";
    rev = "d7c8028c8a225f21c72e999f4999f6b73856d1ad";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-44gElrgOCdl8HT4e/lDV1FNqnPynngNU+icXnJgXwdg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib actionlib-msgs geometry-msgs message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages for fetch_auto_dock package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
