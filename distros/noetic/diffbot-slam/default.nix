
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gmapping }:
buildRosPackage {
  pname = "ros-noetic-diffbot-slam";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "diffbot-release";
    rev = "b54443389448d71f78e972699c5dfd4c0848b1f8";
    owner = "ros-mobile-robots-release";
    sha256 = "sha256-Bbnl8Q0eSh2Uy4mOoQqmo7zNVz7KdRgO+tIZF5NEfFk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gmapping ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The diffbot_slam package'';
    license = with lib.licenses; [ "BSDv3" ];
  };
}
