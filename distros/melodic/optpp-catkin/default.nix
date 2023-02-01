
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, autoconf, catkin, gfortran, git }:
buildRosPackage {
  pname = "ros-melodic-optpp-catkin";
  version = "2.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "optpp_catkin-release";
    rev = "9b2391d1135681d2b406eb98194bf7dfe95fc0fa";
    owner = "ipab-slmc";
    sha256 = "sha256-upln1wsJnkQeht3sLLcNwYJnDnnd69IQh/c1vRSWdZ0=";
  };

  buildType = "catkin";
  buildInputs = [ autoconf catkin gfortran git ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The OPT++ catkin wrapper package'';
    license = with lib.licenses; [ "LGPL" ];
  };
}
