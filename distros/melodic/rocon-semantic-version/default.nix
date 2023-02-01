
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-rocon-semantic-version";
  version = "0.3.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rocon_tools-release";
    rev = "456d8afe5f6f66292253a184b36daa34e1240ce3";
    owner = "yujinrobot-release";
    sha256 = "sha256-/u25yYKPeHlkQvYvweEiNvaMtByrBY8TlYHZ9auT5SE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Internal packaging of the 2.2.2 version of the python semantic version module.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
