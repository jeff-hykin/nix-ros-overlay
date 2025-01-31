
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-ivcon";
  version = "0.1.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ivcon-release";
    rev = "b95c8034f1cf4f39fc73a472a976df549dc6b616";
    owner = "ros-gbp";
    sha256 = "sha256-/AREyVRZcOgZ6unXhnDRXXjgs270+ZhbsaVnzE7IBtQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Mesh Conversion Utility

Used to generate '.iv' files from '.stl' files.  This package has not
been changed since 2001 and appears to be very stable.  We plan on
keeping this package in this revision for mesh conversions.  This
package is only available as a single source file for download.  There
are no local modifications to this package.'';
    license = with lib.licenses; [ "GPL" ];
  };
}
