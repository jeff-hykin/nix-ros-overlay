
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common }:
buildRosPackage {
  pname = "ros-foxy-connext-cmake-module";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosidl_typesupport_connext-release";
    rev = "2aacb11d6d51ddde7ec095ce0f8f3575d14833f3";
    owner = "ros2-gbp";
    sha256 = "sha256-5VhZyN/PJgW22Uz3ioc04h2hTPsTwVjXK5cerSmkKaU=";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ ament-cmake ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Provide CMake module to find RTI Connext.'';
    license = with lib.licenses; [ asl20 ];
  };
}
