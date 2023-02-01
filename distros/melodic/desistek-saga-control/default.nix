
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, desistek-saga-description, uuv-control-cascaded-pid, uuv-thruster-manager }:
buildRosPackage {
  pname = "ros-melodic-desistek-saga-control";
  version = "0.3.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "desistek_saga-release";
    rev = "dcb71a48df3beb9e913f0492e845dd930b0d98e7";
    owner = "uuvsimulator";
    sha256 = "sha256-zztWgXl9XnBH7Xz+OKOiQJ43hmz4vvjFnseZts8+f8U=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ desistek-saga-description uuv-control-cascaded-pid uuv-thruster-manager ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Configuration and launch files to control the Desistek SAGA ROV'';
    license = with lib.licenses; [ asl20 ];
  };
}
