
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-bringup, cob-manipulation, cob-navigation }:
buildRosPackage {
  pname = "ros-noetic-care-o-bot-robot";
  version = "0.7.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "care-o-bot-release";
    rev = "277daebc6e175d6c9a127ea8f4988c5e6989f519";
    owner = "ipa320";
    sha256 = "sha256-3UO+jY6//kS+X1CuX32uj7nwRytih+BZuB8ZN12VIDA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-bringup cob-manipulation cob-navigation ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The care-o-bot-robot meta-package'';
    license = with lib.licenses; [ asl20 ];
  };
}
