
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-rosatomic";
  version = "1.0.25";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_realtime-release";
    rev = "65643195eddc634fdb83f0dbe7bcacc267fab888";
    owner = "ros-gbp";
    sha256 = "sha256-+xjGLnELF3OhXp1TesY/exuwe42otRu/u1+letSQUnU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rosatomic provides the C++11-style atomic operations by pulling symbols from the proposed Boost.Atomic
     package into the ros namespace.  Once C++11-style atomics (std::atomic) are available from compilers, rosatomic will
     conditionally use those instead.'';
    license = with lib.licenses; [ bsdOriginal "BSL-1.0" ];
  };
}
