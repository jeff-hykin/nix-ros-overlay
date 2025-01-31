
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libntcan, libpcan }:
buildRosPackage {
  pname = "ros-noetic-schunk-libm5api";
  version = "0.6.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "schunk_modular_robotics-release";
    rev = "34e6c76ac6d437b6c41bc7f3b9814a132b9fcc0f";
    owner = "ipa320";
    sha256 = "sha256-eQ+DYSbflkN+8LXihVVjqF9boMNqKhB8p1T69P5R7Do=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ libntcan libpcan ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package wraps the libm5api to use it as a ros dependency. Original sources from http://www.schunk-modular-robotics.com/fileadmin/user_upload/software/schunk_libm5api_source.zip.'';
    license = with lib.licenses; [ asl20 ];
  };
}
