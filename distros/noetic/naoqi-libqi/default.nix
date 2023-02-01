
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, openssl }:
buildRosPackage {
  pname = "ros-noetic-naoqi-libqi";
  version = "2.9.7";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libqi-release";
    rev = "42efc3d79c606540c91a659c6e5e23bfcd1a5521";
    owner = "ros-naoqi";
    sha256 = "sha256-yPeM8IWwRJRQfnFPlJPBlmDzsSpv+VMLlba0tkBGpm0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost openssl ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Aldebaran's libqi: a core library for NAOqiOS development'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
