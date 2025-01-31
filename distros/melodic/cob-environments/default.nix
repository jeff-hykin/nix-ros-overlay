
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-default-env-config }:
buildRosPackage {
  pname = "ros-melodic-cob-environments";
  version = "0.6.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_environments-release";
    rev = "25bc4427b14944ac2e31215d938965f2de89c2fa";
    owner = "ipa320";
    sha256 = "sha256-Eemou2FKSPMpPJnEcKx+h7DiVal7JtxS0yfVvIwJnlc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-default-env-config ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This stack holds packages for IPA default environment configuration.'';
    license = with lib.licenses; [ asl20 ];
  };
}
