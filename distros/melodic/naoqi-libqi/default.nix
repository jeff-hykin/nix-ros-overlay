
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, openssl }:
buildRosPackage {
  pname = "ros-melodic-naoqi-libqi";
  version = "2.9.0-r8";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libqi-release";
    rev = "9eb7286e402f7e7c9069f9c60231f29421184828";
    owner = "ros-naoqi";
    sha256 = "sha256-Wa7KENxGqSTOJ7DLNOFWqlfC6x91OAf5WdR0xHHQbtU=";
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
