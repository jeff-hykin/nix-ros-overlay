
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pddl-planner }:
buildRosPackage {
  pname = "ros-melodic-pddl-planner-viewer";
  version = "0.1.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_planning-release";
    rev = "90b4f74a74e3a08768874afb0b7508123711f155";
    owner = "tork-a";
    sha256 = "sha256-/TNoX6J0na0Aoo0PCHs6BpWiCjMCj0lOgI8/B1zEILA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pddl-planner ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''a viewer of pddl_planner.'';
    license = with lib.licenses; [ asl20 ];
  };
}
