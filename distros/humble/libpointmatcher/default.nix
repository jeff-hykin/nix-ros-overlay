
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, cmake, eigen, libnabo }:
buildRosPackage {
  pname = "ros-humble-libpointmatcher";
  version = "1.3.1-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libpointmatcher-release";
    rev = "0ed5b47746e28c0e56fde1b7aa17bdc0200bd58c";
    owner = "ros2-gbp";
    sha256 = "sha256-kz4xW5jFlA5Or5PIY32iQ2JsKrbswAT7Lag8SQx/5dQ=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ boost eigen libnabo ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''libpointmatcher is a modular ICP library, useful for robotics and computer vision.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
