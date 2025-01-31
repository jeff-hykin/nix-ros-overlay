
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dwa-local-planner, laser-tilt-controller-filter, pr2-move-base, pr2-navigation-config, pr2-navigation-global, pr2-navigation-local, pr2-navigation-perception, pr2-navigation-self-filter, pr2-navigation-slam, pr2-navigation-teleop, semantic-point-annotator }:
buildRosPackage {
  pname = "ros-melodic-pr2-navigation";
  version = "0.1.28-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_navigation-release";
    rev = "03af1985de0ea11273a1e0cb1e5d06870c1a068a";
    owner = "pr2-gbp";
    sha256 = "sha256-n4j1J14BGLymWab3zkUkfpJ072WXz140q/VPvj0CHDg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dwa-local-planner laser-tilt-controller-filter pr2-move-base pr2-navigation-config pr2-navigation-global pr2-navigation-local pr2-navigation-perception pr2-navigation-self-filter pr2-navigation-slam pr2-navigation-teleop semantic-point-annotator ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_navigation stack holds common configuration options for running the'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
