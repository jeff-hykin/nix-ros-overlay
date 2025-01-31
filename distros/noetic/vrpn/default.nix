
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake }:
buildRosPackage {
  pname = "ros-noetic-vrpn";
  version = "7.34.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vrpn-release";
    rev = "95a6a5232a64559152df35581ea5c0581adad844";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-IGs3hSZDF+0jG0TXBDQPEcvVS/6UU7eG2hqu53BxFPg=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ catkin ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''The VRPN is a library and set of servers that interfaces with virtual-reality systems, such as VICON, OptiTrack, and others.'';
    license = with lib.licenses; [ "BSL-1.0" ];
  };
}
