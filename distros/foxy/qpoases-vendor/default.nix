
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, subversion }:
buildRosPackage {
  pname = "ros-foxy-qpoases-vendor";
  version = "3.2.3-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "qpoases_vendor-release";
    rev = "a80a18111d8dd988ebb46968c560d5d9881efbfa";
    owner = "Autoware-AI";
    sha256 = "sha256-jUSNiB8b0P8JHYXdXeKMs5Ucxjk+fhbPqxcJnD2GIQ4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ subversion ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''Wrapper around qpOASES to make it available to the ROS ecosystem.'';
    license = with lib.licenses; [ asl20 "LGPL" ];
  };
}
