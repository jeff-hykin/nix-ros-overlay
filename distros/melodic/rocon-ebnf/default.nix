
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages, rosunit }:
buildRosPackage {
  pname = "ros-melodic-rocon-ebnf";
  version = "0.3.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rocon_tools-release";
    rev = "e3e7d8c5bbfc801ec10969aa845dad6dc6e08d53";
    owner = "yujinrobot-release";
    sha256 = "sha256-3pefRkUHcxAktikNgDOTdOgRyirAcIYN3GfTedRxQGk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.catkin-pkg ];
  checkInputs = [ rosunit ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Internal packaging of the 0.91 version of the simple python
    <a href="http://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_Form">EBNF</a>
    parser written by LParis.'';
    license = with lib.licenses; [ "GPL" ];
  };
}
