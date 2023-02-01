
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, moveback-recovery }:
buildRosPackage {
  pname = "ros-melodic-mbf-recovery-behaviors";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mbf_recovery_behaviors";
    rev = "b57a5631f84586cd0d34133cb48ef51d28ffaed3";
    owner = "uos-gbp";
    sha256 = "sha256-taQWQgl6bn4VR0X2KEWAa9NIyqF5du2MzB//d5730Zo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ moveback-recovery ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The mbf_recovery_behaviors package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
