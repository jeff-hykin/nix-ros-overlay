
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl,  }:
buildRosPackage {
  pname = "ros-galactic-ament-lint";
  version = "0.10.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_lint-release";
    rev = "70a7509a6cf921fc64deeb665f03559e06dd3cbe";
    owner = "ros2-gbp";
    sha256 = "sha256-uh5PDA1nbFbxuA+KaIHW5Gfetel4tnIJ/DPq2t1ZirQ=";
  };

  buildType = "ament_python";

  meta = {
    description = ''Providing common API for ament linter packages.'';
    license = with lib.licenses; [ asl20 ];
  };
}
