
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joint-qualification-controllers, pr2-bringup-tests, pr2-counterbalance-check, pr2-self-test-msgs }:
buildRosPackage {
  pname = "ros-noetic-pr2-self-test";
  version = "1.0.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_self_test-release";
    rev = "921062158cfc447c016059794fc0c6f5799d5c90";
    owner = "pr2-gbp";
    sha256 = "sha256-QKGI4UV3Lgp6swZDwW8P8JeEbWs19pBB4OU0AnluY3c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ joint-qualification-controllers pr2-bringup-tests pr2-counterbalance-check pr2-self-test-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_self_test package'';
    license = with lib.licenses; [ "TODO-CATKIN-PACKAGE-LICENSE" ];
  };
}
