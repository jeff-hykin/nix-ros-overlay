
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-docker-control, cob-reflector-referencing, cob-safety-controller }:
buildRosPackage {
  pname = "ros-noetic-cob-substitute";
  version = "0.6.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_substitute-release";
    rev = "2fc6f451e001133424a37069d8f1b0b2a4741b36";
    owner = "ipa320";
    sha256 = "sha256-7XkdS4/kC4sPJN+dp2jY9gi4yibOm0NtLaXx0JJdviE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-docker-control cob-reflector-referencing cob-safety-controller ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''cob_substitute'';
    license = with lib.licenses; [ asl20 ];
  };
}
