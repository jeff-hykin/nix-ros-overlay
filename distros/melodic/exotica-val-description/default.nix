
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-exotica-val-description";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "exotica_val_description-release";
    rev = "ad1be7d5602ee7bc5fa670fd5bb705830f1d1e97";
    owner = "wxmerkt";
    sha256 = "sha256-3tIPzhzHqVjh09fL/JcRv/CCVyzqgM5xiuOyAFYSYZg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''val_description version including our updated meshes for unit testing and visualisation. Based on the OpenHumanoids fork of the val_description package by NASA JSC. The most current version of the original package can be found at http://gitlab.com/nasa-jsc-robotics/val_description'';
    license = with lib.licenses; [ "NASA-1.3" ];
  };
}
