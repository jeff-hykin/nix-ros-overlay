
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-multimaster-msgs";
  version = "0.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cpr_multimaster_tools-release";
    rev = "031d44e3c400f2fb353d2bbd6e261c13d892da19";
    owner = "clearpath-gbp";
    sha256 = "sha256-ZhEIJM0qg5NeJRAcDaQQPYg3ASlfccy/aL8O8Hsy3ZM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The multimaster_msgs package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
