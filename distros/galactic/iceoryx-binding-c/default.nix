
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, iceoryx-posh, iceoryx-utils }:
buildRosPackage {
  pname = "ros-galactic-iceoryx-binding-c";
  version = "1.0.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "iceoryx-release";
    rev = "fda875fff624b3a2c43bb866fb42d17c5bb3178b";
    owner = "ros2-gbp";
    sha256 = "sha256-bx5uzRhkPLJGbTASPjN+jmx5dZRicAbO6BGZcbquIE4=";
  };

  buildType = "cmake";
  buildInputs = [ cmake iceoryx-posh iceoryx-utils ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Eclipse iceoryx inter-process-communication (IPC) middleware C-Language Binding'';
    license = with lib.licenses; [ asl20 ];
  };
}
