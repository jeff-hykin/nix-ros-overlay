
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake }:
buildRosPackage {
  pname = "ros-melodic-schunk-svh-library";
  version = "1.0.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "schunk_svh_library-release";
    rev = "beb2b65b4438a79959ac4c863b18e4d31c57c12c";
    owner = "fzi-forschungszentrum-informatik";
    sha256 = "sha256-n1ECtIIlm0bPzlzsul/AH8CHSn5tXYbNJqbiCC9AuSs=";
  };

  buildType = "cmake";
  buildInputs = [ boost cmake ];
  propagatedBuildInputs = [ catkin ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Standalone C++ library for accessing the Schunk five finger hand.'';
    license = with lib.licenses; [ "GPL-3.0-or-later" ];
  };
}
