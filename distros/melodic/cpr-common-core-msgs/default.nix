
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-cpr-common-core-msgs";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cpr_common_core-release";
    rev = "fae13306d58767b0d0a0d554fb42f12736db3f89";
    owner = "clearpath-gbp";
    sha256 = "sha256-yPOBs+VjDVMUls0Wlxta7cdW+eg48cY+38RoaRdvb8s=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''cpr_common_core_msgs'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
