
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-copyright, ament-cmake-core, ament-cmake-lint-cmake, ament-cmake-test, ament-xmllint }:
buildRosPackage {
  pname = "ros-foxy-ament-cmake-xmllint";
  version = "0.9.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_lint-release";
    rev = "67301f7710704834d37c951864cec72777390c4b";
    owner = "ros2-gbp";
    sha256 = "sha256-fjTsTc1BWs5EO3r6V4j409kveiRQRtAKdWPafvRaxNE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-core ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  propagatedBuildInputs = [ ament-cmake-test ament-xmllint ];
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-xmllint ];

  meta = {
    description = ''The CMake API for ament_xmllint to check XML file using xmmlint.'';
    license = with lib.licenses; [ asl20 ];
  };
}
