
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-rwt-utils-3rdparty";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "cf78ea6c0133848f20922c83452ee4c5b71b2228";
    owner = "tork-a";
    sha256 = "sha256-PlVplDJ/EAKAUxhoxQRs3L8sbc+XIB3zLS14qk6DZzM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rwt_utils_3rdparty package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
