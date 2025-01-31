
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake }:
buildRosPackage {
  pname = "ros-rolling-urg-c";
  version = "1.0.4001-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "urg_c-release";
    rev = "fc34a2e23a647197f881de6e914f11a050ca0a94";
    owner = "ros2-gbp";
    sha256 = "sha256-mLPyvykduwQfjJnXdqEjfbvuc4jn37BwcetdxOLxEGQ=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''The urg_c package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
