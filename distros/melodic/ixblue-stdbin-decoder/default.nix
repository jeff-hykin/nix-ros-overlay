
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake, git, gtest }:
buildRosPackage {
  pname = "ros-melodic-ixblue-stdbin-decoder";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ixblue_stdbin_decoder-release";
    rev = "365d4c37fd2fbad60e255f4b361bdc4e49821c43";
    owner = "ixblue";
    sha256 = "sha256-fjucNh530wldQfBOf7SINGGp0e2XJKOhjMCw3aiWI2w=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  checkInputs = [ git gtest ];
  propagatedBuildInputs = [ boost catkin ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''iXblue parsing library for protocol iXblue stdbin'';
    license = with lib.licenses; [ mit ];
  };
}
