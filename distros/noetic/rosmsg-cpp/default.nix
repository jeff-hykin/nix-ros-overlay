
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cpp-common, geometry-msgs, message-runtime, python3, ros-environment, roslib, rosunit }:
buildRosPackage {
  pname = "ros-noetic-rosmsg-cpp";
  version = "1.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosmsg_cpp-release";
    rev = "a11d93e6eedc43104e5699ee42fa2bccc08661f2";
    owner = "ctu-vras";
    sha256 = "sha256-78DbURdOPEKrEXwGtg/MUxsbNesIKpCn1DjqSh4q8No=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ros-environment ];
  checkInputs = [ geometry-msgs rosunit ];
  propagatedBuildInputs = [ cpp-common message-runtime python3 roslib ];
  nativeBuildInputs = [ catkin ros-environment ];

  meta = {
    description = ''C++ library for getting full message definition or MD5 sum given message type as string'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
