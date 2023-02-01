
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-exceptions, ecl-threads, ecl-time, geometry-msgs, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-yocs-keyop";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "e40469aed3b372320724917015c719333c6f78ae";
    owner = "yujinrobot-release";
    sha256 = "sha256-Oh5zWu9f9fgFLXVO+M4O0q+s0yjFyZWQaAcY6Lg/PfU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-exceptions ecl-threads ecl-time geometry-msgs roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Keyboard teleoperation for your robot'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
