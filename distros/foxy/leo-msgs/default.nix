
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, builtin-interfaces, rosidl-default-generators, rosidl-default-runtime }:
buildRosPackage {
  pname = "ros-foxy-leo-msgs";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leo_common-release";
    rev = "fa648533924e1bd62427b6bbd2e1365e2e724a1b";
    owner = "ros2-gbp";
    sha256 = "sha256-boOryphikqMMf8uP/1Xmin2asRfNUBPWsu6qmbsoOqQ=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Message and Service definitions for Leo Rover'';
    license = with lib.licenses; [ mit ];
  };
}
