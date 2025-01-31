
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ixblue-ins-driver, ixblue-ins-msgs }:
buildRosPackage {
  pname = "ros-noetic-ixblue-ins";
  version = "0.1.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ixblue_ins_stdbin_driver-release";
    rev = "6e1ab5c9861e784691ad6d52fe37bd8d92476250";
    owner = "ixblue";
    sha256 = "sha256-KRogPGGUVYeQP7RODBj5CTtl4IzJAPFwot2MxP9q0ck=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ixblue-ins-driver ixblue-ins-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage for iXblue INS driver'';
    license = with lib.licenses; [ mit ];
  };
}
