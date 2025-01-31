
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common }:
buildRosPackage {
  pname = "ros-humble-ament-nodl";
  version = "0.1.0-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_nodl-release";
    rev = "08f9af4308948b0901ee5d864a44c89360ecbc8c";
    owner = "ros2-gbp";
    sha256 = "sha256-9azhFZrnSaHJiIRFdPiDTiDO3j2v3eKxQBNdAEFwd5A=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Ament extension for exporting NoDL .xml files'';
    license = with lib.licenses; [ lgpl3Only ];
  };
}
