
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, qt5, rviz, slam-toolbox-msgs }:
buildRosPackage {
  pname = "ros-noetic-slam-toolbox-rviz";
  version = "1.5.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "slam_toolbox-release";
    rev = "32f46a0698d027b5e9e43654062ae22f9e6c703c";
    owner = "SteveMacenski";
    sha256 = "sha256-/WUb/nswpJv8P+5dtYOd8F0l5PoUKqOCp3yF53Mk+Mc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ qt5.qtbase rviz slam-toolbox-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides a sped up improved slam karto with updated SDK and visualization and modification toolsets'';
    license = with lib.licenses; [ "LGPL" ];
  };
}
