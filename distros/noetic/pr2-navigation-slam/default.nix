
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gmapping, joint-trajectory-generator, move-base, pr2-machine, pr2-move-base, pr2-navigation-config, pr2-tuck-arms-action, topic-tools }:
buildRosPackage {
  pname = "ros-noetic-pr2-navigation-slam";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_navigation-release";
    rev = "757731d689e4c0e0ed025bacc84679a11f7ba83d";
    owner = "pr2-gbp";
    sha256 = "sha256-4QGXxeP0tH86jo2QWNV/+iB/AVyRke6ui0t3rVPM3Ik=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gmapping joint-trajectory-generator move-base pr2-machine pr2-move-base pr2-navigation-config pr2-tuck-arms-action topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package holds launch files for running the'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
