
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-fuse-msgs";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fuse-release";
    rev = "66ab92c72bac7836ae8070e6c0ec0410a44a1268";
    owner = "locusrobotics";
    sha256 = "sha256-kpAxD9WBkmHZ5rWPvPtgjcvs0J12pfqF9onpMebQYNc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The fuse_msgs package contains messages capable of holding serialized fuse objects'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
