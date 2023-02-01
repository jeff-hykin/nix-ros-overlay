
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-rocon-icons";
  version = "0.3.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rocon_tools-release";
    rev = "05aea29620c966938a4c6091beb1475ace80adff";
    owner = "yujinrobot-release";
    sha256 = "sha256-rPMdyaQz5MCo1af9I0AMoEMuSLKTHXChQ9YrMggz5tU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.catkin-pkg ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Icons for rocon.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
