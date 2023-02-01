
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, care-o-bot-robot, care-o-bot-simulation, catkin, cob-manipulation, cob-navigation }:
buildRosPackage {
  pname = "ros-noetic-care-o-bot";
  version = "0.7.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "care-o-bot-release";
    rev = "c7c2b31853f02069557b5643a2acb0681b5b4dae";
    owner = "ipa320";
    sha256 = "sha256-G7u+4RVPEaHrlmM0/I13WATTfWFDighUJKn+/cly+nM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ care-o-bot-robot care-o-bot-simulation cob-manipulation cob-navigation ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The care-o-bot meta-package'';
    license = with lib.licenses; [ asl20 ];
  };
}
