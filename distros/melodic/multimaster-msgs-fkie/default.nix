
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-multimaster-msgs-fkie";
  version = "0.8.12";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "multimaster_fkie-release";
    rev = "a9a63872a027b2cf02d78a92d487b7a947593d93";
    owner = "fkie-release";
    sha256 = "sha256-rBXBy/KUDPobfiwqPozi2shgOJ2BCW/T+655H8IAdrg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The messages required by multimaster packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
