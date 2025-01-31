
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-flake8, ament-cmake-pytest, maliput-object, python3, pythonPackages }:
buildRosPackage {
  pname = "ros-foxy-maliput-object-py";
  version = "0.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "maliput_object_py-release";
    rev = "c2dec933796830159c9824430ccd78bf1d9ae310";
    owner = "ros2-gbp";
    sha256 = "sha256-ZVH61cg7NEiAefInJN+NXCWXkjUCY6vC4XzzSKnkWi8=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake python3 ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-flake8 ament-cmake-pytest ];
  propagatedBuildInputs = [ maliput-object pythonPackages.pybind11 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Maliput Object bindings'';
    license = with lib.licenses; [ "BSD-Clause-3" ];
  };
}
