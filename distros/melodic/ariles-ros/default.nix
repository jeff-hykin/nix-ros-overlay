
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, eigen, libyamlcpp, roscpp }:
buildRosPackage {
  pname = "ros-melodic-ariles-ros";
  version = "1.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ariles-release";
    rev = "974154c34bcb64536e4852803f91265783a4e0c6";
    owner = "asherikov";
    sha256 = "sha256-dqfxCK+sGn97jKoq62fQV5ap9rjyNg9jSk3xVtDotYA=";
  };

  buildType = "cmake";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost eigen libyamlcpp roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Catkin package Ariles serialization/configuration library'';
    license = with lib.licenses; [ asl20 ];
  };
}
