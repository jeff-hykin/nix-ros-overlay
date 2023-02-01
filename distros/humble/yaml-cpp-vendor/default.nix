
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, libyamlcpp }:
buildRosPackage {
  pname = "ros-humble-yaml-cpp-vendor";
  version = "8.0.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yaml_cpp_vendor-release";
    rev = "79732fea6d0b597f6eafd3669a080911f55c5678";
    owner = "ros2-gbp";
    sha256 = "sha256-R1aTHcYjtYmfcWjzmR+jUY1QTC9gjGR+eAzV1KUYKmg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ libyamlcpp ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Wrapper around yaml-cpp, it provides a fixed CMake module and an ExternalProject build of it.'';
    license = with lib.licenses; [ asl20 mit ];
  };
}
