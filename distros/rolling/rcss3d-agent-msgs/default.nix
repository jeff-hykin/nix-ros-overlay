
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, builtin-interfaces, rosidl-default-generators, rosidl-default-runtime }:
buildRosPackage {
  pname = "ros-rolling-rcss3d-agent-msgs";
  version = "0.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rcss3d_agent-release";
    rev = "4ad117cff485b4be2050acb57ef75c03575649bc";
    owner = "ros2-gbp";
    sha256 = "sha256-AN/eyLroQDeZjI/JosPYI5tZHhbJn0jP1d8D3wjuN54=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Custom messages for communicating with rcss3d_agent'';
    license = with lib.licenses; [ asl20 ];
  };
}
