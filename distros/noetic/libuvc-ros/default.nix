
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libuvc-camera }:
buildRosPackage {
  pname = "ros-noetic-libuvc-ros";
  version = "0.0.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libuvc_ros-release";
    rev = "b1c0132786e13386cc63043d7fa70c8b8a970a68";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-+VLUKncrHQ1v4JxMM672o3c/D2dKkJAMeuJcbNw0xzA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ libuvc-camera ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''libuvc_ros metapackage'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
