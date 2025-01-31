
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, cmake, gtest, ros-industrial-cmake-boilerplate }:
buildRosPackage {
  pname = "ros-noetic-boost-plugin-loader";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "boost_plugin_loader-release";
    rev = "9e7e5c0676e2544a607ff7d9081263482a71e28f";
    owner = "tesseract-robotics-release";
    sha256 = "sha256-ZjoSvWcFE3AzAO8UquQff8huxjOm3V5FJ6XZ07XyYDs=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ros-industrial-cmake-boilerplate ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ boost ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Boost plugin loader implementation'';
    license = with lib.licenses; [ asl20 ];
  };
}
