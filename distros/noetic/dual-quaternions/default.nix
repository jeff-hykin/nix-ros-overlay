
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pyquaternion }:
buildRosPackage {
  pname = "ros-noetic-dual-quaternions";
  version = "0.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dual_quaternions-release";
    rev = "87f2dcc5486fa29a4259f69c90b9ca3da701aa58";
    owner = "Achllle";
    sha256 = "sha256-MqSy4w6xMyoGTBTkUhni7eHaHhByXTQ1FXJPUd3du2c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pyquaternion ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''dual quaternion operations'';
    license = with lib.licenses; [ mit ];
  };
}
